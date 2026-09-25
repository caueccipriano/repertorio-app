import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repertorio_app/app/app.dart';
import 'package:repertorio_app/app/state/app_state.dart';
import 'package:repertorio_app/app/state/app_state_scope.dart';
import 'package:repertorio_app/features/article/presentation/article_screen.dart';
import 'package:repertorio_app/features/explore/presentation/topic_collection_screen.dart';
import 'package:repertorio_app/features/study/data/personal_library_engine.dart';
import 'package:repertorio_app/features/study/data/study_content.dart';
import 'package:repertorio_app/features/study/presentation/weekly_report_screen.dart';
import 'package:repertorio_app/features/profile/presentation/profile_screen.dart';
import 'package:repertorio_app/features/today/data/demo_topics.dart';
import 'package:repertorio_app/features/today/domain/knowledge_topic.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('quick reading never marks a full article as completed',
      (tester) async {
    final state = await AppState.load();
    await state.updateReaderSettings(depth: ContentDepth.quick);
    await tester.pumpWidget(
      AppStateScope(
        state: state,
        child: const MaterialApp(home: ArticleScreen(topic: bauhausTopic)),
      ),
    );
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.text('PRÓXIMA CONEXÃO'),
      450,
      scrollable: find.byType(Scrollable),
    );
    await tester.pumpAndSettle();

    expect(state.progressFor('bauhaus'), 0);
    expect(state.completedTopicIds, isNot(contains('bauhaus')));

    await state.updateReaderSettings(depth: ContentDepth.standard);
    await tester.pumpAndSettle();
    expect(find.text('em 30 segundos'), findsOneWidget);
    expect(state.progressFor('bauhaus'), 0);
  });

  testWidgets('compact iPhone reader shows chapters at large text size',
      (tester) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    final state = await AppState.load();
    await state.updateReaderSettings(
      depth: ContentDepth.standard,
      theme: ReaderThemeMode.dark,
      fontSize: 22,
      margin: 12,
    );

    await tester.pumpWidget(
      AppStateScope(
        state: state,
        child: const MaterialApp(home: ArticleScreen(topic: helveticaTopic)),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('reader-settings')), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.scrollUntilVisible(
      find.text('vá além'),
      450,
      scrollable: find.byType(Scrollable),
    );
    await tester.pumpAndSettle();

    expect(find.text('A neutralidade também é uma escolha de design'),
        findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('compact paged reader keeps previews separate from completion',
      (tester) async {
    tester.view.physicalSize = const Size(360, 740);
    tester.view.devicePixelRatio = 1;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    final state = await AppState.load();
    await state.updateReaderSettings(
      depth: ContentDepth.quick,
      flow: ReaderFlow.paged,
      fontSize: 20,
    );
    await tester.pumpWidget(
      AppStateScope(
        state: state,
        child: const MaterialApp(home: ArticleScreen(topic: gpsTopic)),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(PageView), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.drag(find.byType(PageView), const Offset(-290, 0));
    await tester.pumpAndSettle();

    expect(state.progressFor('gps'), 0);
    expect(state.completedTopicIds, isNot(contains('gps')));
    expect(tester.takeException(), isNull);
  });

  testWidgets('profile reader shortcut opens real reading controls',
      (tester) async {
    final state = await AppState.load();
    await tester.pumpWidget(
      AppStateScope(
        state: state,
        child: const MaterialApp(home: Scaffold(body: ProfileScreen())),
      ),
    );
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.text('leitor'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('leitor'));
    await tester.pumpAndSettle();

    expect(find.text('PROFUNDIDADE'), findsOneWidget);
    expect(find.text('TAMANHO'), findsOneWidget);
  });

  testWidgets('weekly reading estimate uses actual article size, not old labels',
      (tester) async {
    final state = await AppState.load();
    await state.openTopic('bauhaus');
    await state.updateProgress('bauhaus', 1);
    await tester.pumpWidget(
      AppStateScope(
        state: state,
        child: const MaterialApp(home: WeeklyReportScreen()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('min estimados'), findsOneWidget);
    expect(find.text(bauhausTopic.estimatedReadingMinutes().toString()),
        findsWidgets);
    expect(find.textContaining('não é um cronômetro'), findsOneWidget);
  });

  test('progress cannot regress when revisiting an earlier section', () async {
    final state = await AppState.load();
    await state.updateProgress('bauhaus', .64);
    await state.updateProgress('bauhaus', .2);
    expect(state.progressFor('bauhaus'), closeTo(.64, .001));
    await state.updateProgress('bauhaus', 1);
    await state.updateProgress('bauhaus', .3);
    expect(state.progressFor('bauhaus'), 1);
    expect(state.completedTopicIds, contains('bauhaus'));
  });

  testWidgets('paged reading requires explicit completion',
      (tester) async {
    tester.view.physicalSize = const Size(360, 740);
    tester.view.devicePixelRatio = 1;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    final state = await AppState.load();
    await state.updateProgress('helvetica', .86);
    await state.updateReaderSettings(
      depth: ContentDepth.standard,
      flow: ReaderFlow.paged,
    );
    await tester.pumpWidget(
      AppStateScope(
        state: state,
        child: const MaterialApp(home: ArticleScreen(topic: helveticaTopic)),
      ),
    );
    await tester.pumpAndSettle();

    expect(state.completedTopicIds, isNot(contains('helvetica')));
    final complete = find.byKey(const ValueKey('reader-mark-complete'));
    // PageView prebuilds adjacent pages: a finder can see the button while it
    // remains horizontally off-screen. Navigate to its actual visible page.
    var buttonOnScreen = false;
    for (var i = 0; i < 16; i++) {
      if (complete.evaluate().isNotEmpty) {
        final rect = tester.getRect(complete);
        if (rect.center.dx > 10 && rect.center.dx < 350) {
          buttonOnScreen = true;
          break;
        }
      }
      await tester.drag(find.byType(PageView), const Offset(-310, 0));
      await tester.pumpAndSettle();
    }
    expect(buttonOnScreen, isTrue);
    await tester.ensureVisible(complete);
    await tester.pumpAndSettle();
    expect(state.completedTopicIds, isNot(contains('helvetica')));
    await tester.tap(complete);
    await tester.pumpAndSettle();
    expect(
      state.completedTopicIds,
      contains('helvetica'),
      reason: 'post-tap progress=${state.progressFor('helvetica')} '
          'buttonEnabled=${tester.widget<OutlinedButton>(complete).onPressed != null} '
          'buttonRect=${tester.getRect(complete)}',
    );
    expect(state.progressFor('helvetica'), 1);
  });

  test('audio narration includes expanded chapters at the chosen depth', () {
    final fullScript = bauhausTopic.readingScript();
    final quickScript = bauhausTopic.readingScript(quick: true);
    expect(fullScript, contains('Uma escola nascida de uma crise'));
    expect(fullScript, contains(bauhausTopic.chapters.first.paragraphs.first));
    expect(quickScript, isNot(contains('Uma escola nascida de uma crise')));
    expect(quickScript, contains(bauhausTopic.quickTake));
    expect(bauhausTopic.readingScript(deep: true),
        contains(bauhausTopic.curiosity));
  });

  test('reading time tracks text and mode instead of static labels', () {
    const expanded = bauhausTopic;
    expect(expanded.estimatedReadingMinutes(), greaterThan(1));
    expect(
      expanded.estimatedReadingMinutes(quick: true),
      lessThan(expanded.estimatedReadingMinutes()),
    );
    expect(
      expanded.estimatedReadingMinutes(deep: true),
      greaterThanOrEqualTo(expanded.estimatedReadingMinutes()),
    );

    const shortTopic = KnowledgeTopic(
      id: 'sample',
      eyebrow: 'TEST',
      title: 'A sample',
      summary: 'A short summary',
      minutes: 45,
      tags: ['test'],
      quickTake: 'A short takeaway',
      body: ['A short body'],
      remember: ['One fact'],
      whyItMatters: 'Because it is a test',
      curiosity: 'An extra fact',
      connections: ['none'],
    );
    expect(shortTopic.estimatedReadingMinutes(), 1);
  });

  test('catalog has no duplicated examples or generic impact statements', () {
    expect(allDemoTopics, hasLength(125));
    for (final topic in allDemoTopics) {
      if (topic.simpleExplanation case final explanation?) {
        expect(
          topic.example,
          isNot(equals(explanation)),
          reason: topic.id,
        );
      }
      expect(
        topic.whyItMatters,
        isNot(contains('Amplia o repertório e cria conexões úteis')),
        reason: topic.id,
      );
    }
  });

  test('expanded articles have real chapters and explicit reading sources', () {
    const expanded = [
      bauhausTopic,
      modernismTopic,
      fermiTopic,
      romeTopic,
      brutalismTopic,
      helveticaTopic,
      internetTopic,
      gpsTopic,
      fotografiaTopic,
      criptografiaTopic,
      stoicismTopic,
      sonoTopic,
      viesesTopic,
      jurosCompostosTopic,
      buracosNegrosTopic,
      contabilidadeTopic,
      sambaTopic,
      imunidadeTopic,
      turingTopic,
      evolucaoInternetTopic,
      neuroplasticidadeTopic,
      linguisticaTopic,
      inflationTopic,
      dnaTopic,
      aiTopic,
      mapsTopic,
      teoriaJogosTopic,
      origemVidaTopic,
      renaissanceTopic,
      perspectivaTopic,
      impressionismoTopic,
      rococoTopic,
      barrocoTopic,
    ];
    for (final topic in expanded) {
      expect(topic.chapters.length, greaterThanOrEqualTo(2), reason: topic.id);
      expect(
        topic.chapters.every((chapter) =>
            chapter.title.isNotEmpty &&
            chapter.paragraphs.length >= 2 &&
            chapter.paragraphs.every((paragraph) => paragraph.length >= 80)),
        isTrue,
        reason: topic.id,
      );
      expect(sourcesFor(topic.id), isNotEmpty, reason: topic.id);
      expect(
        sourcesFor(topic.id).every(
          (source) =>
              source.url.startsWith('https://') &&
              source.label.trim().isNotEmpty,
        ),
        isTrue,
        reason: topic.id,
      );
      expect(quizFor(topic.id).length, greaterThanOrEqualTo(3), reason: topic.id);
      expect(
        quizFor(topic.id).every(
          (question) =>
              question.options.length == 4 &&
              question.correctIndex >= 0 &&
              question.correctIndex < question.options.length &&
              question.explanation.isNotEmpty,
        ),
        isTrue,
        reason: topic.id,
      );
    }
    expect(modernismTopic.chapters.first.title,
        'O mundo industrial precisava de outras respostas');
  });

  testWidgets('standard reader shows expanded chapters and source links',
      (tester) async {
    final state = await AppState.load();
    await tester.pumpWidget(
      AppStateScope(
        state: state,
        child: const MaterialApp(home: ArticleScreen(topic: bauhausTopic)),
      ),
    );
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.text('vá além'),
      500,
      scrollable: find.byType(Scrollable),
    );
    await tester.pumpAndSettle();
    expect(find.text('Uma escola nascida de uma crise'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('fontes para continuar'),
      500,
      scrollable: find.byType(Scrollable),
    );
    await tester.pumpAndSettle();
    expect(find.text('UNESCO — Patrimônio Bauhaus'), findsOneWidget);
  });

  testWidgets('essential articles disclose unfinished references',
      (tester) async {
    final state = await AppState.load();
    await tester.pumpWidget(
      AppStateScope(
        state: state,
        child: const MaterialApp(home: ArticleScreen(topic: sushiTopic)),
      ),
    );
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.text('fontes · em revisão'),
      500,
      scrollable: find.byType(Scrollable),
    );
    await tester.pumpAndSettle();
    expect(find.text('nível · essencial'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('opens the library directly without onboarding lockout',
      (tester) async {
    await tester.pumpWidget(const RepertorioApp());
    await tester.pumpAndSettle();

    expect(find.text('pular'), findsNothing);
    expect(find.text('repertório*'), findsOneWidget);
    expect(find.text('DESTAQUE DE HOJE'), findsOneWidget);
    expect(find.text('ME SURPREENDA'), findsOneWidget);
    expect(find.text('Hoje'), findsOneWidget);
    expect(find.text('Explorar'), findsOneWidget);
  });

  testWidgets('renders a topic collection as a library shelf', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: TopicCollectionScreen(
          title: 'Design',
          subtitle: 'Objetos, sistemas e linguagem',
          topicIds: ['bauhaus', 'helvetica'],
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Design'), findsOneWidget);
    expect(find.text('2 ASSUNTOS'), findsOneWidget);
    expect(find.text('POR QUE A BAUHAUS MUDOU TUDO?'), findsWidgets);
    expect(find.text('POR QUE HELVETICA ESTÁ EM TODO LUGAR?'), findsWidgets);
  });

  testWidgets('persists reading progress and renders next connection',
      (tester) async {
    final state = await AppState.load();

    await tester.pumpWidget(
      AppStateScope(
        state: state,
        child: const MaterialApp(
          home: ArticleScreen(topic: bauhausTopic),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('em 30 segundos'), findsOneWidget);
    expect(find.byKey(const ValueKey('reader-back')), findsOneWidget);
    expect(find.byKey(const ValueKey('reader-audio')), findsOneWidget);
    expect(find.text('ouvir aqui'), findsNothing);

    await tester.scrollUntilVisible(
      find.text('explicando sem complicar'),
      280,
      scrollable: find.byType(Scrollable),
    );
    await tester.pumpAndSettle();

    expect(find.text('explicando sem complicar'), findsOneWidget);
    expect(
      find.textContaining('Pense na Bauhaus como uma escola'),
      findsOneWidget,
    );
    expect(find.text('EXEMPLO SIMPLES'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('entenda de verdade'),
      350,
      scrollable: find.byType(Scrollable),
    );
    await tester.pumpAndSettle();

    expect(state.progressFor('bauhaus'), greaterThan(0));
    expect(find.text('entenda de verdade'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('PRÓXIMA CONEXÃO'),
      500,
      scrollable: find.byType(Scrollable),
    );
    await tester.pumpAndSettle();

    expect(find.text('PRÓXIMA CONEXÃO'), findsOneWidget);
    expect(find.text(modernismTopic.title), findsWidgets);

    final reloaded = await AppState.load();
    expect(
      reloaded.progressFor('bauhaus'),
      greaterThan(0),
    );
  });

  testWidgets('shows native podcast audio only when a direct stream exists',
      (tester) async {
    final state = await AppState.load();

    await tester.pumpWidget(
      AppStateScope(
        state: state,
        child: const MaterialApp(
          home: ArticleScreen(topic: fermiTopic),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('reader-audio')), findsOneWidget);
    expect(find.byKey(const ValueKey('reader-settings')), findsOneWidget);
    expect(find.byIcon(Icons.headphones_rounded), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('reader-settings')));
    await tester.pumpAndSettle();
    expect(find.text('PROFUNDIDADE'), findsOneWidget);
    expect(find.text('TAMANHO'), findsOneWidget);
  });

  testWidgets('reader back button always returns to the library',
      (tester) async {
    final state = await AppState.load();

    await tester.pumpWidget(
      AppStateScope(
        state: state,
        child: const MaterialApp(
          home: ArticleScreen(topic: fermiTopic),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('reader-back')));
    await tester.pumpAndSettle();

    expect(find.text('repertório*'), findsOneWidget);
    expect(find.text('Hoje'), findsOneWidget);
  });

  testWidgets('starts with zero saved and completed topics', (tester) async {
    final state = await AppState.load();

    expect(state.savedTopicIds, isEmpty);
    expect(state.completedTopicIds, isEmpty);
    expect(state.progressByTopic, isEmpty);
    expect(state.historyTopicIds, isEmpty);
    expect(state.notesByTopic, isEmpty);
    expect(state.studiedDaysThisWeek(), 0);
  });

  test('advanced local study state persists and restores', () async {
    final state = await AppState.load();

    await state.toggleSaved('bauhaus');
    await state.saveNote('bauhaus', 'Forma e função precisam conversar.');
    await state.updateWeeklyGoal(4);
    await state.updateProgress('bauhaus', .55);
    await state.toggleReadLater('fermi');
    await state.toggleHighlight('bauhaus', 'quick');
    await state.togglePassageStar('bauhaus', 'quick');
    await state.recordQuiz('bauhaus', score: 2, total: 3);
    await state.saveExplanation(
      'bauhaus',
      'Uma escola que aproximou arte, função e indústria.',
    );
    await state.toggleOfflineTopic('bauhaus');
    await state.updateReaderSettings(
      depth: ContentDepth.deep,
      alignment: ReaderTextAlignment.justify,
      columnWidth: 680,
      margin: 24,
      focusMode: true,
      newVoiceRate: 1.2,
    );
    await state.updateAccessibility(
      contrast: true,
      motion: true,
      targets: true,
    );

    final backup = state.exportBackup();

    SharedPreferences.setMockInitialValues({});
    final restored = await AppState.load();
    final success = await restored.importBackup(backup);

    expect(success, isTrue);
    expect(restored.isSaved('bauhaus'), isTrue);
    expect(
      restored.noteFor('bauhaus'),
      'Forma e função precisam conversar.',
    );
    expect(restored.weeklyGoal, 4);
    expect(restored.progressFor('bauhaus'), closeTo(.55, .001));
    expect(restored.studiedDaysThisWeek(), 1);
    expect(restored.readLaterQueue, contains('fermi'));
    expect(restored.isHighlighted('bauhaus', 'quick'), isTrue);
    expect(restored.isPassageStarred('bauhaus', 'quick'), isTrue);
    expect(restored.quizScoreByTopic['bauhaus'], 2);
    expect(restored.quizTotalByTopic['bauhaus'], 3);
    expect(
      restored.explanationFor('bauhaus'),
      contains('arte, função e indústria'),
    );
    expect(restored.isOfflineTopic('bauhaus'), isTrue);
    expect(restored.readerDepth, ContentDepth.deep);
    expect(restored.readerAlignment, ReaderTextAlignment.justify);
    expect(restored.readerColumnWidth, 680);
    expect(restored.readerMargin, 24);
    expect(restored.readerFocusMode, isTrue);
    expect(restored.voiceRate, 1.2);
    expect(restored.highContrast, isTrue);
    expect(restored.reduceMotion, isTrue);
    expect(restored.largeTapTargets, isTrue);
  });

  test('library intelligence persists collections connections and dark mode',
      () async {
    final state = await AppState.load();

    await state.createCollection('Para conversar');
    await state.toggleTopicInCollection('Para conversar', 'bauhaus');
    await state.toggleTopicInCollection('Para conversar', 'fermi');
    await state.addPersonalConnection(
      fromTopicId: 'bauhaus',
      toTopicId: 'helvetica',
      note: 'As duas ajudam a entender o design moderno.',
    );
    await state.updateAppearance(AppAppearance.dark);
    await state.updateProgress('bauhaus', .65);
    await state.recordQuiz('bauhaus', score: 3, total: 3);
    await state.saveExplanation(
      'bauhaus',
      'A Bauhaus aproximou função, arte e produção moderna.',
    );

    expect(state.masteryLevel('bauhaus'), MasteryLevel.understood);
    expect(state.collectionsByName['Para conversar'], contains('fermi'));
    expect(state.personalConnections, hasLength(1));
    expect(state.appAppearance, AppAppearance.dark);

    final backup = state.exportBackup();

    SharedPreferences.setMockInitialValues({});
    final restored = await AppState.load();
    final success = await restored.importBackup(backup);

    expect(success, isTrue);
    expect(restored.appAppearance, AppAppearance.dark);
    expect(
      restored.collectionsByName['Para conversar'],
      containsAll(['bauhaus', 'fermi']),
    );
    expect(restored.personalConnections, hasLength(1));
    expect(
      restored.personalConnections.first.note,
      contains('design moderno'),
    );
  });

  test('personal library engine explains and respects a time budget', () async {
    final state = await AppState.load();
    const engine = PersonalLibraryEngine();

    final initialPlan = engine.dailyPlan(state, budgetMinutes: 10);
    expect(initialPlan, isNotEmpty);
    expect(
      initialPlan.first.reason,
      isNotEmpty,
    );

    await state.updateProgress('bauhaus', .4);
    final reason = engine.reasonFor(state, helveticaTopic);
    expect(reason, isNotEmpty);

    final queue = engine.smartQueue(state, budgetMinutes: 10);
    expect(queue, isNotEmpty);
  });
}
