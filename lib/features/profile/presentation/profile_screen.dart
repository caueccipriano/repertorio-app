import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../core/widgets/editorial_frame.dart';
import '../../../core/widgets/paper_texture.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaperTexture(
      child: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: EditorialFrame(
            maxWidth: 760,
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'seu repertório',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'O registro da biblioteca que você está construindo.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.muted,
                      ),
                ),
                const SizedBox(height: 26),
                const _LibraryStats(),
                const SizedBox(height: 30),
                Text(
                  'áreas exploradas',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 31,
                      ),
                ),
                const SizedBox(height: 16),
                const _ProgressRow(label: 'História', value: .72),
                const _ProgressRow(label: 'Ciência', value: .61),
                const _ProgressRow(label: 'Arte', value: .32),
                const _ProgressRow(label: 'Economia', value: .54),
                const _ProgressRow(label: 'Design', value: .68),
                const SizedBox(height: 12),
                const _ReadingRecord(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LibraryStats extends StatelessWidget {
  const _LibraryStats();

  @override
  Widget build(BuildContext context) {
    const stats = [
      ('27', 'assuntos lidos'),
      ('11', 'salvos'),
      ('6', 'rabbit holes'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: AppColors.paperWhite,
        border: Border.all(color: AppColors.ink),
      ),
      child: Row(
        children: stats.indexed
            .map(
              (item) => Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    border: item.$1 == stats.length - 1
                        ? null
                        : const Border(
                            right: BorderSide(color: AppColors.ink),
                          ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        item.$2.$1,
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              color: AppColors.blue,
                              fontSize: 36,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.$2.$2,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              fontSize: 9,
                              color: AppColors.muted,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _ProgressRow extends StatelessWidget {
  const _ProgressRow({required this.label, required this.value});

  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    final percent = (value * 100).round();

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 16,
                    ),
              ),
              const Spacer(),
              Text(
                '$percent%',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.blue,
                      fontSize: 10,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: value,
            minHeight: 5,
            backgroundColor: AppColors.line,
            color: AppColors.blue,
          ),
        ],
      ),
    );
  }
}

class _ReadingRecord extends StatelessWidget {
  const _ReadingRecord();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.ink,
        border: Border.all(color: AppColors.ink),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.auto_stories_outlined,
            color: AppColors.paperWhite,
            size: 28,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '7 dias explorando',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.paperWhite,
                        fontSize: 16,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Sua semana teve mais História, Design e Ciência.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
