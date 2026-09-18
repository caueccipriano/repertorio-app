import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 28, 20, 36),
        children: [
          Text(
            'seu repertório',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 10),
          Text(
            'Um mapa simples do que você vem explorando.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.muted,
                ),
          ),
          const SizedBox(height: 30),
          const _ProgressRow(label: 'História', value: .72),
          const _ProgressRow(label: 'Ciência', value: .61),
          const _ProgressRow(label: 'Arte', value: .32),
          const _ProgressRow(label: 'Economia', value: .54),
        ],
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
      padding: const EdgeInsets.only(bottom: 22),
      child: Column(
        children: [
          Row(
            children: [
              Text(label, style: Theme.of(context).textTheme.titleLarge),
              const Spacer(),
              Text(
                '$percent%',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.blue,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          LinearProgressIndicator(
            value: value,
            minHeight: 7,
            backgroundColor: AppColors.line,
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }
}
