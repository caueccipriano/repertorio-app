import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../core/widgets/editorial_frame.dart';
import '../../../core/widgets/knowledge_cover.dart';
import '../../../core/widgets/paper_texture.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaperTexture(
      child: SafeArea(
        bottom: false,
        child: EditorialFrame(
          maxWidth: 860,
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'minha biblioteca',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const Spacer(),
                  IconButton(
                    tooltip: 'Buscar nos salvos',
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Assuntos que você guardou para voltar depois.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.muted,
                    ),
              ),
              const SizedBox(height: 20),
              const _SavedTabs(),
              const SizedBox(height: 26),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final columns = constraints.maxWidth >= 700
                        ? 4
                        : constraints.maxWidth >= 480
                            ? 3
                            : 2;
                    const gap = 14.0;
                    final width =
                        (constraints.maxWidth - gap * (columns - 1)) / columns;

                    return SingleChildScrollView(
                      child: Wrap(
                        spacing: gap,
                        runSpacing: 22,
                        children: const [
                          _SavedBook(
                            title: 'Bauhaus',
                            category: 'Design · História',
                            style: KnowledgeCoverStyle.bauhaus,
                            progress: 1,
                          ),
                          _SavedBook(
                            title: 'Modernismo',
                            category: 'Arquitetura',
                            style: KnowledgeCoverStyle.archive,
                            progress: .46,
                          ),
                          _SavedBook(
                            title: 'Paradoxo de Fermi',
                            category: 'Ciência',
                            style: KnowledgeCoverStyle.orbit,
                            progress: 0,
                          ),
                          _SavedBook(
                            title: 'Helvetica',
                            category: 'Design',
                            style: KnowledgeCoverStyle.typography,
                            progress: 0,
                          ),
                        ]
                            .map(
                              (book) => SizedBox(
                                width: width,
                                child: book,
                              ),
                            )
                            .toList(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SavedTabs extends StatelessWidget {
  const _SavedTabs();

  @override
  Widget build(BuildContext context) {
    const tabs = ['TODOS', 'LENDO', 'CONCLUÍDOS'];

    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.ink),
      ),
      child: Row(
        children: tabs.indexed
            .map(
              (item) => Expanded(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: item.$1 == 0 ? AppColors.ink : Colors.transparent,
                    border: item.$1 == tabs.length - 1
                        ? null
                        : const Border(
                            right: BorderSide(color: AppColors.ink),
                          ),
                  ),
                  child: Text(
                    item.$2,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: item.$1 == 0
                              ? AppColors.paperWhite
                              : AppColors.ink,
                          fontSize: 9,
                          letterSpacing: .6,
                        ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _SavedBook extends StatelessWidget {
  const _SavedBook({
    required this.title,
    required this.category,
    required this.style,
    required this.progress,
  });

  final String title;
  final String category;
  final KnowledgeCoverStyle style;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KnowledgeCover(
              title: title,
              kicker: category,
              style: style,
              width: width,
              height: width * 1.3,
              onTap: () {},
            ),
            const SizedBox(height: 9),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 14,
                  ),
            ),
            const SizedBox(height: 3),
            Text(
              category,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.muted,
                    fontSize: 9,
                  ),
            ),
            if (progress > 0) ...[
              const SizedBox(height: 7),
              LinearProgressIndicator(
                value: progress,
                minHeight: 4,
                color: AppColors.blue,
                backgroundColor: AppColors.line,
              ),
            ],
          ],
        );
      },
    );
  }
}
