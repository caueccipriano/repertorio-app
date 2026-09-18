import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repertorio_app/app/app.dart';
import 'package:repertorio_app/features/article/presentation/article_screen.dart';
import 'package:repertorio_app/features/today/data/demo_topics.dart';

void main() {
  testWidgets('opens through onboarding into the knowledge library',
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
  });

  testWidgets('renders the article structure', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ArticleScreen(topic: bauhausTopic),
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

    expect(find.text('entenda de verdade'), findsOneWidget);
  });
}
