import 'package:flutter_test/flutter_test.dart';
import 'package:repertorio_app/app/app.dart';

void main() {
  testWidgets('renders the daily knowledge experience', (tester) async {
    await tester.pumpWidget(const RepertorioApp());
    await tester.pumpAndSettle();

    expect(find.text('repertório*'), findsOneWidget);
    expect(find.text('POR QUE A BAUHAUS MUDOU TUDO?'), findsOneWidget);

    await tester.tap(find.text('POR QUE A BAUHAUS MUDOU TUDO?'));
    await tester.pumpAndSettle();

    expect(find.text('em 30 segundos'), findsOneWidget);
    expect(find.text('entenda de verdade'), findsOneWidget);
  });
}
