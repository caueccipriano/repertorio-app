import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repertorio_app/features/profile/presentation/cultural_map.dart';

void main() {
  const counts = <String, int>{
    'PSICOLOGIA': 4,
    'HISTÓRIA': 2,
    'CIÊNCIA': 5,
    'ECONOMIA': 1,
    'ARTE & DESIGN': 3,
    'TECNOLOGIA': 4,
    'MUNDO': 2,
    'CULTURA': 5,
  };

  Future<void> pumpMap(
    WidgetTester tester, {
    required ThemeMode mode,
  }) async {
    await tester.binding.setSurfaceSize(const Size(320, 780));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: mode,
        home: const Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(8),
              child: CulturalMap(
                counts: counts,
                strengths: ['CIÊNCIA', 'CULTURA'],
                weakCategories: ['ECONOMIA', 'HISTÓRIA'],
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
  }

  testWidgets('cultural map renders on narrow light layout without overflow',
      (tester) async {
    await pumpMap(tester, mode: ThemeMode.light);

    expect(find.text('CONSTELAÇÃO CULTURAL'), findsOneWidget);
    expect(find.text('8/8 áreas'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('cultural map renders on narrow dark layout without overflow',
      (tester) async {
    await pumpMap(tester, mode: ThemeMode.dark);

    expect(find.text('CONSTELAÇÃO CULTURAL'), findsOneWidget);
    expect(find.text('8/8 áreas'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
