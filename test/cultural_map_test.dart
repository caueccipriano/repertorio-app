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
    ValueChanged<String>? onCategoryTap,
  }) async {
    await tester.binding.setSurfaceSize(const Size(320, 780));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: mode,
        home: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: CulturalMap(
                counts: counts,
                strengths: const ['CIÊNCIA', 'CULTURA'],
                weakCategories: const ['ECONOMIA', 'HISTÓRIA'],
                onCategoryTap: onCategoryTap,
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

  testWidgets('cultural map legend opens the selected area', (tester) async {
    String? tapped;
    await pumpMap(
      tester,
      mode: ThemeMode.light,
      onCategoryTap: (category) => tapped = category,
    );

    await tester.tap(find.text('Ciência').last);
    await tester.pump();

    expect(tapped, 'CIÊNCIA');
    expect(tester.takeException(), isNull);
  });
}
