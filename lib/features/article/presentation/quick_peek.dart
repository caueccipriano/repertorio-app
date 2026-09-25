import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../today/domain/knowledge_topic.dart';
import 'article_screen.dart';

Future<void> showQuickPeek(
  BuildContext context,
  KnowledgeTopic topic,
) {
  return showModalBottomSheet<void>(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    backgroundColor: AppColors.paperWhite,
    builder: (sheetContext) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'EM 30 SEGUNDOS',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.blue,
                    letterSpacing: 1.3,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              topic.title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 16),
            Text(
              topic.quickTake,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 17,
                  ),
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                Text(
                  '~${topic.estimatedReadingMinutes()} min · ${topic.tags.join(' · ')}',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.muted,
                        fontSize: 10,
                      ),
                ),
                const Spacer(),
                FilledButton.icon(
                  onPressed: () {
                    Navigator.of(sheetContext).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => ArticleScreen(topic: topic),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('ler'),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
