import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import test from 'node:test';
import vm from 'node:vm';

const html = readFileSync('web/index.html', 'utf8');
const match = html.match(
  /const runtimeBuildId = '__APP_BUILD_ID__';[\s\S]*?window\.repertorioUpdates = \{[\s\S]*?\n      \};/
);
assert.ok(match, 'web/index.html must define the stamped release protocol');
const current = 'a'.repeat(40);
const next = 'b'.repeat(40);

function setup({ version = next, fetchThrows = false } = {}) {
  let fetchedUrl = '';
  let options;
  const unregistered = [];
  let reloadedTo = '';
  const location = {
    href: 'https://example.test/repertorio-app/?from=icon',
    replace(url) { reloadedTo = url; },
  };
  const context = {
    window: { location },
    document: { baseURI: 'https://example.test/repertorio-app/' },
    URL, Date,
    fetch: async (url, settings) => {
      fetchedUrl = url;
      options = settings;
      if (fetchThrows) throw new Error('offline');
      return { ok: true, json: async () => ({ version }) };
    },
    navigator: {
      serviceWorker: {
        getRegistrations: async () => [
          { unregister: async () => { unregistered.push(true); } },
        ],
      },
    },
  };
  vm.runInNewContext(match[0].replace('__APP_BUILD_ID__', current), context);
  return {
    api: context.window.repertorioUpdates,
    get fetchedUrl() { return fetchedUrl; },
    get options() { return options; },
    get unregistered() { return unregistered; },
    get reloadedTo() { return reloadedTo; },
  };
}

test('detects a new GitHub Pages release using a fresh version file', async () => {
  const page = setup();
  assert.equal(await page.api.check(), true);
  assert.match(page.fetchedUrl, /^https:\/\/example\.test\/repertorio-app\/version\.json\?_v=\d+$/);
  assert.equal(page.options.cache, 'no-store');
});

test('does not show a false update for the installed release', async () => {
  assert.equal(await setup({ version: current }).api.check(), false);
});

test('does not block the app when offline', async () => {
  assert.equal(await setup({ fetchThrows: true }).api.check(), false);
});

test('cleans old workers and reloads a cache-busted URL on request', async () => {
  const page = setup();
  await page.api.apply();
  assert.deepEqual(page.unregistered, [true]);
  const url = new URL(page.reloadedTo);
  assert.equal(url.pathname, '/repertorio-app/');
  assert.equal(url.searchParams.get('from'), 'icon');
  assert.match(url.searchParams.get('_updated'), /^\d+$/);
});

test('unmodified developer preview never announces a release', async () => {
  const context = {
    window: { location: { href: 'https://example.test/repertorio-app/' } },
    document: { baseURI: 'https://example.test/repertorio-app/' },
    URL, Date,
    fetch: async () => { throw new Error('preview must not fetch'); },
    navigator: {},
  };
  vm.runInNewContext(match[0], context);
  assert.equal(await context.window.repertorioUpdates.check(), false);
});
