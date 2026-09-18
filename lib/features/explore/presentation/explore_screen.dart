import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  static const topics = [
    'História',
    'Ciência',
    'Arte',
    'Design',
    'Arquitetura',
    'Filosofia',
    'Psicologia',
    'Economia',
    'Tecnologia',
    'Literatura',
    'Cinema',
    'Música',
    'Moda',
    'Gastronomia',
    'Geografia',
    'Sociedade',
    'Cultura pop',
    'Mundo',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 28, 20, 36),
        children: [
          Text(
            'explorar',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Escolha uma porta de entrada. O resto vira conexão.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.muted,
                ),
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: topics
                .map(
                  (topic) => ActionChip(
                    label: Text(topic),
                    onPressed: () {},
                    backgroundColor: AppColors.paperWhite,
                    side: const BorderSide(color: AppColors.ink),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
