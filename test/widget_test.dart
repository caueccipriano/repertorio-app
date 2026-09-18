import 'package:flutter_test/flutter_test.dart';
import 'package:repertorio_app/app/app.dart';

void main() {
  testWidgets('renders the daily knowledge experience', (tester) async {
    await tester.pumpWidget(const RepertorioApp());
    await tester.pumpAndSettle();

    expect(find.text('repertório*'), findsOneWidget);
    expect(find.text('POR QUE A BAUHAUS MUDOU TUDO?'), findsOneWidget);
    expect(find.text('rapidinhas'), findsOneWidget);
  });
}
