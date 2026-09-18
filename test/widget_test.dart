import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repertorio_app/app/app.dart';
import 'package:repertorio_app/features/article/presentation/article_screen.dart';
import 'package:repertorio_app/features/today/data/demo_topics.dart';

void main() {
  testWidgets('renders the daily knowledge experience', (tester) async {
    await tester.pumpWidget(const RepertorioApp());
    await tester.pumpAndSettle();

    expect(find.text('repertório*'), findsOneWidget);
    expect(find.text('POR QUE A BAUHAUS MUDOU TUDO?'), findsOneWidget);
    expect(find.text('Hoje'), findsOneWidget);
    expect(find.text('Explorar'), findsOneWidget);
  });

  testWidgets('renders the article structure', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ArticleScreen(topic: bauhausTopic),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('em 30 segundos'), findsOneWidget);
    expect(find.text('entenda de verdade'), findsOneWidget);
  });
}
