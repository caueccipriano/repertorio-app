import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repertorio_app/app/app.dart';
import 'package:repertorio_app/app/state/app_state.dart';
import 'package:repertorio_app/app/state/app_state_scope.dart';
import 'package:repertorio_app/features/article/presentation/article_screen.dart';
import 'package:repertorio_app/features/explore/presentation/topic_collection_screen.dart';
import 'package:repertorio_app/features/today/data/demo_topics.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('shows onboarding once and then opens the library',
      (tester) async {
    await tester.pumpWidget(const RepertorioApp());
    await tester.pumpAndSettle();

    expect(find.text('saiba um pouco\nsobre tudo.'), findsOneWidget);
    expect(find.text('pular'), findsOneWidget);

    await tester.tap(find.text('pular'));
    await tester.pumpAndSettle();

    expect(find.text('repertório*'), findsOneWidget);
    expect(find.text('DESTAQUE DE HOJE'), findsOneWidget);
    expect(find.text('para hoje'), findsOneWidget);
    expect(find.text('Início'), findsOneWidget);
    expect(find.text('Catálogo'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpAndSettle();
    await tester.pumpWidget(const RepertorioApp());
    await tester.pumpAndSettle();

    expect(find.text('pular'), findsNothing);
    expect(find.text('repertório*'), findsOneWidget);
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
}
