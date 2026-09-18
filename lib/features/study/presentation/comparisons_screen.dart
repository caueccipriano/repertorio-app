import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../data/study_content.dart';

class ComparisonsScreen extends StatelessWidget {
  const ComparisonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('comparar')),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 34),
          itemCount: comparisons.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final item = comparisons[index];
            return _ComparisonCard(item: item);
          },
        ),
      ),
    );
  }
}

class _ComparisonCard extends StatelessWidget {
  const _ComparisonCard({required this.item});

  final ComparisonEntry item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.paperWhite,
        border: Border.all(color: AppColors.ink),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              item.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.ink),
                bottom: BorderSide(color: AppColors.ink),
              ),
            ),
            child: Row(
              children: [
                const SizedBox(width: 92),
                Expanded(
                  child: _HeaderCell(
                    text: item.leftLabel,
                    dark: true,
                  ),
                ),
                Expanded(
                  child: _HeaderCell(text: item.rightLabel),
                ),
              ],
            ),
          ),
          ...item.rows.map(
            (row) => Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.line),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 92,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        row.aspect,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(
                              color: AppColors.muted,
                              fontSize: 9,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: _ValueCell(text: row.left),
                  ),
                  Expanded(
                    child: _ValueCell(text: row.right),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  const _HeaderCell({
    required this.text,
    this.dark = false,
  });

  final String text;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: dark ? AppColors.deepBlue : AppColors.softBlue,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: dark ? Colors.white : AppColors.ink,
              fontSize: 10,
            ),
      ),
    );
  }
}

class _ValueCell extends StatelessWidget {
  const _ValueCell({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(color: AppColors.line),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              height: 1.35,
            ),
      ),
    );
  }
}
