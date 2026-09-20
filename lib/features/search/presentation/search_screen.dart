import 'package:flutter/material.dart';

import '../../../app/state/app_state_scope.dart';
import '../../article/presentation/article_screen.dart';
import '../../article/presentation/quick_peek.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';

enum _SearchFilter {
  quick,
  unread,
  completed,
  saved,
  withNote,
  withMedia,
  offline,
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  final Set<_SearchFilter> _filters = {};
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<KnowledgeTopic> _results(BuildContext context) {
    final state = AppStateScope.of(context);
    final q = _query.trim().toLowerCase();

    final results = allDemoTopics.where((topic) {
      final haystack = [
        topic.title,
        topic.summary,
        ...topic.tags,
        ...topic.connections,
        topic.quickTake,
        ...topic.body,
      ].join(' ').toLowerCase();

      if (q.isNotEmpty && !haystack.contains(q)) return false;
      if (_filters.contains(_SearchFilter.quick) && topic.minutes > 5) {
        return false;
      }
      if (_filters.contains(_SearchFilter.unread) &&
          state.progressFor(topic.id) > 0) {
        return false;
      }
      if (_filters.contains(_SearchFilter.completed) &&
          !state.completedTopicIds.contains(topic.id)) {
        return false;
      }
      if (_filters.contains(_SearchFilter.saved) &&
          !state.savedTopicIds.contains(topic.id)) {
        return false;
      }
      if (_filters.contains(_SearchFilter.withNote) &&
          state.noteFor(topic.id).isEmpty) {
        return false;
      }
      if (_filters.contains(_SearchFilter.withMedia) &&
          topic.media.isEmpty) {
        return false;
      }
      if (_filters.contains(_SearchFilter.offline) &&
          !state.isOfflineTopic(topic.id)) {
        return false;
      }
      return true;
    }).toList();

    if (q.isNotEmpty) {
      results.sort((a, b) {
        final byScore = _searchScore(b, q).compareTo(_searchScore(a, q));
        if (byScore != 0) return byScore;
        return a.title.compareTo(b.title);
      });
      return results;
    }

    if (_filters.isNotEmpty) {
      return results;
    }

    final unseen = results
        .where((topic) => !state.historyTopicIds.contains(topic.id))
        .toList();
    final pool = unseen.length >= 8 ? unseen : results;
    if (pool.isEmpty) return const [];

    final start = DateTime.now().day % pool.length;
    return List.generate(
      pool.length >= 8 ? 8 : pool.length,
      (index) => pool[(start + index) % pool.length],
    );
  }

  int _searchScore(KnowledgeTopic topic, String query) {
    var score = 0;
    final title = topic.title.toLowerCase();
    final summary = topic.summary.toLowerCase();
    final quickTake = topic.quickTake.toLowerCase();
    final tags = topic.tags.map((tag) => tag.toLowerCase()).toList();

    if (title == query) score += 10;
    if (title.contains(query)) score += 6;
    if (tags.contains(query)) score += 5;
    if (tags.any((tag) => tag.contains(query))) score += 4;
    if (summary.contains(query)) score += 2;
    if (quickTake.contains(query)) score += 1;

    return score;
  }

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final results = _results(context);
    final idle = _query.trim().isEmpty && _filters.isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('buscar'),
        actions: [
          IconButton(
            tooltip: 'Surpreenda-me',
            onPressed: () {
              final candidates = allDemoTopics
                  .where(
                    (topic) =>
                        !state.completedTopicIds.contains(topic.id) &&
                        !state.historyTopicIds.contains(topic.id),
                  )
                  .toList();
              final pool = candidates.isEmpty ? allDemoTopics : candidates;
              final topic =
                  pool[DateTime.now().millisecondsSinceEpoch % pool.length];
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => ArticleScreen(topic: topic),
                ),
              );
            },
            icon: const Icon(Icons.casino_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          children: [
            TextField(
              controller: _controller,
              autofocus: false,
              onChanged: (value) => setState(() => _query = value),
              decoration: InputDecoration(
                hintText: 'Roma, vinho, Bauhaus, inflação…',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _query.isEmpty
                    ? null
                    : IconButton(
                        onPressed: () {
                          _controller.clear();
                          setState(() => _query = '');
                        },
                        icon: const Icon(Icons.close),
                      ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.onSurface),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.onSurface),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                ),
              ),
            ),
            if (_query.isEmpty && _filters.isEmpty) ...[
              const SizedBox(height: 14),
              _SearchSuggestions(
                onSelect: (value) {
                  _controller.text = value;
                  _controller.selection = TextSelection.collapsed(
                    offset: value.length,
                  );
                  setState(() => _query = value);
                },
              ),
            ],
            const SizedBox(height: 14),
            _FilterBar(
              selected: _filters,
              onToggle: (filter) {
                setState(() {
                  if (!_filters.add(filter)) {
                    _filters.remove(filter);
                  }
                });
              },
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Text(
                  idle
                      ? '8 IDEIAS PARA COMEÇAR'
                      : '${results.length} RESULTADO${results.length == 1 ? '' : 'S'}',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontSize: 10,
                        letterSpacing: 1.1,
                      ),
                ),
                const Spacer(),
                if (_filters.isNotEmpty)
                  TextButton(
                    onPressed: () => setState(_filters.clear),
                    child: const Text('limpar filtros'),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            if (results.isEmpty)
              const _EmptySearch()
            else
              ...results.map(
                (topic) => _SearchResult(
                  topic: topic,
                  progress: state.progressFor(topic.id),
                  saved: state.isSaved(topic.id),
                  offline: state.isOfflineTopic(topic.id),
                  onOpen: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => ArticleScreen(topic: topic),
                    ),
                  ),
                  onPeek: () => showQuickPeek(context, topic),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SearchSuggestions extends StatelessWidget {
  const _SearchSuggestions({required this.onSelect});

  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    const suggestions = [
      ('design', Icons.grid_view_outlined),
      ('história', Icons.account_balance_outlined),
      ('ciência', Icons.science_outlined),
      ('economia', Icons.show_chart_outlined),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 13, 14, 14),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest,
        border: Border.all(color: colors.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EXPLORE UMA IDEIA',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: colors.primary,
                  fontSize: 9,
                  letterSpacing: 1,
                ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: suggestions
                .map(
                  (item) => ActionChip(
                    avatar: Icon(item.$2, size: 16),
                    label: Text(item.$1),
                    onPressed: () => onSelect(item.$1),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _FilterBar extends StatelessWidget {
  const _FilterBar({
    required this.selected,
    required this.onToggle,
  });

  final Set<_SearchFilter> selected;
  final ValueChanged<_SearchFilter> onToggle;

  @override
  Widget build(BuildContext context) {
    const items = [
      (_SearchFilter.quick, '≤ 5 min'),
      (_SearchFilter.unread, 'não lidos'),
      (_SearchFilter.completed, 'concluídos'),
      (_SearchFilter.saved, 'salvos'),
      (_SearchFilter.withNote, 'com nota'),
      (_SearchFilter.withMedia, 'com mídia'),
      (_SearchFilter.offline, 'offline'),
    ];

    return Wrap(
      spacing: 7,
      runSpacing: 7,
      children: items
          .map(
            (item) => FilterChip(
              label: Text(item.$2),
              selected: selected.contains(item.$1),
              onSelected: (_) => onToggle(item.$1),
            ),
          )
          .toList(),
    );
  }
}

class _SearchResult extends StatelessWidget {
  const _SearchResult({
    required this.topic,
    required this.progress,
    required this.saved,
    required this.offline,
    required this.onOpen,
    required this.onPeek,
  });

  final KnowledgeTopic topic;
  final double progress;
  final bool saved;
  final bool offline;
  final VoidCallback onOpen;
  final VoidCallback onPeek;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onOpen,
      onLongPress: onPeek,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42,
              height: 56,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    topic.minutes.toString(),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                  ),
                  const Text(
                    'MIN',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 7,
                      fontWeight: FontWeight.w800,
                      letterSpacing: .7,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topic.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 16,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    spacing: 7,
                    runSpacing: 4,
                    children: [
                      Text(
                        topic.tags.join(' · '),
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                              fontSize: 9,
                            ),
                      ),
                      if (progress > 0)
                        Text(
                          '${(progress * 100).round()}%',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 9,
                              ),
                        ),
                      if (saved)
                        const Icon(Icons.bookmark, size: 13),
                      if (offline)
                        const Icon(Icons.offline_pin, size: 13),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward, size: 18),
          ],
        ),
      ),
    );
  }
}

class _EmptySearch extends StatelessWidget {
  const _EmptySearch();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36),
      child: Text(
        'Nada por aqui com esses filtros. Tente ampliar a busca.',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
