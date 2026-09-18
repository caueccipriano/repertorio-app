import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../core/widgets/editorial_decorations.dart';
import '../../../core/widgets/editorial_frame.dart';
import '../../../core/widgets/knowledge_cover.dart';
import '../../../core/widgets/paper_texture.dart';
import '../../article/presentation/article_screen.dart';
import '../data/demo_topics.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaperTexture(
      child: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: EditorialFrame(
            maxWidth: 860,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _LibraryStatusBar(),
                const SizedBox(height: 16),
                _FeaturedKnowledge(
                  onOpen: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const ArticleScreen(topic: bauhausTopic),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                const _LibraryNavigation(),
                const SizedBox(height: 24),
                _Shelf(
                  title: 'para hoje',
                  subtitle: '4 leituras · ~23 min',
                  entries: const [
                    _ShelfEntry(
                      title: 'Por que a Bauhaus mudou tudo?',
                      category: 'Design · História',
                      minutes: '6 min',
                      style: KnowledgeCoverStyle.bauhaus,
                      opensFeaturedArticle: true,
                    ),
                    _ShelfEntry(
                      title: 'O paradoxo de Fermi',
                      category: 'Ciência',
                      minutes: '5 min',
                      style: KnowledgeCoverStyle.orbit,
                    ),
                    _ShelfEntry(
                      title: 'Por que Roma caiu?',
                      category: 'História',
                      minutes: '7 min',
                      style: KnowledgeCoverStyle.columns,
                    ),
                    _ShelfEntry(
                      title: 'De onde veio o símbolo @?',
                      category: 'Tecnologia',
                      minutes: '5 min',
                      style: KnowledgeCoverStyle.typography,
                    ),
                  ],
                  onOpenFeatured: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => const ArticleScreen(topic: bauhausTopic),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                const _ContinueShelf(),
                const SizedBox(height: 28),
                const _Shelf(
                  title: 'coisas que vale saber',
                  subtitle: 'uma estante para ficar mais curioso',
                  entries: [
                    _ShelfEntry(
                      title: 'Brutalismo',
                      category: 'Arquitetura',
                      minutes: '4 min',
                      style: KnowledgeCoverStyle.archive,
                    ),
                    _ShelfEntry(
                      title: 'Por que vinho envelhece?',
                      category: 'Gastronomia',
                      minutes: '5 min',
                      style: KnowledgeCoverStyle.waves,
                    ),
                    _ShelfEntry(
                      title: 'Helvetica',
                      category: 'Design',
                      minutes: '4 min',
                      style: KnowledgeCoverStyle.typography,
                    ),
                    _ShelfEntry(
                      title: 'O que é inflação?',
                      category: 'Economia',
                      minutes: '6 min',
                      style: KnowledgeCoverStyle.columns,
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                const _RabbitHoleShelf(),
                const SizedBox(height: 14),
                const Center(
                  child: HandNote(
                    'sua biblioteca mental cresce uma leitura por vez.',
                    fontSize: 20,
                    color: AppColors.muted,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LibraryStatusBar extends StatelessWidget {
  const _LibraryStatusBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'repertório*',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.blue,
                fontWeight: FontWeight.w800,
                letterSpacing: -.7,
              ),
        ),
        const Spacer(),
        Text(
          '17 SET · 21:27',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontSize: 10,
                color: AppColors.muted,
                letterSpacing: .7,
              ),
        ),
        const SizedBox(width: 10),
        const Icon(Icons.menu_book_outlined, size: 17),
      ],
    );
  }
}

class _FeaturedKnowledge extends StatelessWidget {
  const _FeaturedKnowledge({required this.onOpen});

  final VoidCallback onOpen;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 620;
        final height = wide ? 330.0 : 264.0;

        return Container(
          height: height,
          padding: EdgeInsets.all(wide ? 18 : 12),
          decoration: BoxDecoration(
            color: AppColors.paperWhite,
            border: Border.all(color: AppColors.ink, width: 1.2),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: wide ? 5 : 46,
                child: KnowledgeCover(
                  title: 'Bauhaus',
                  kicker: '1919—1933',
                  style: KnowledgeCoverStyle.bauhaus,
                  width: double.infinity,
                  height: double.infinity,
                  selected: true,
                  onTap: onOpen,
                ),
              ),
              SizedBox(width: wide ? 22 : 14),
              Expanded(
                flex: wide ? 7 : 54,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DESTAQUE DE HOJE',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 9,
                            letterSpacing: 1.3,
                            color: AppColors.blue,
                          ),
                    ),
                    SizedBox(height: wide ? 18 : 10),
                    Text(
                      'Por que a\nBauhaus\nmudou tudo?',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: wide ? 48 : 31,
                            height: .95,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Design · História',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.muted,
                            fontSize: 10,
                          ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 9,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.ink),
                            borderRadius: BorderRadius.circular(99),
                          ),
                          child: Text(
                            '6 MIN',
                            style:
                                Theme.of(context).textTheme.labelLarge?.copyWith(
                                      fontSize: 9,
                                    ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          tooltip: 'Abrir leitura',
                          onPressed: onOpen,
                          visualDensity: VisualDensity.compact,
                          icon: const Icon(Icons.arrow_forward, size: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LibraryNavigation extends StatelessWidget {
  const _LibraryNavigation();

  @override
  Widget build(BuildContext context) {
    const items = ['INÍCIO', 'TRILHAS', 'TEMAS', 'SALVOS'];

    return Container(
      height: 42,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.ink),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(color: AppColors.ink),
              ),
            ),
            child: const Icon(Icons.menu_book_outlined, size: 18),
          ),
          ...items.indexed.map(
            (item) => Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: item.$1 == 0 ? AppColors.ink : Colors.transparent,
                  border: item.$1 == items.length - 1
                      ? null
                      : const Border(
                          right: BorderSide(color: AppColors.ink),
                        ),
                ),
                child: Text(
                  item.$2,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color:
                            item.$1 == 0 ? AppColors.paperWhite : AppColors.ink,
                        fontSize: 9,
                        letterSpacing: .6,
                      ),
                ),
              ),
            ),
          ),
          Container(
            width: 42,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(color: AppColors.ink),
              ),
            ),
            child: const Icon(Icons.search, size: 19),
          ),
        ],
      ),
    );
  }
}

class _Shelf extends StatelessWidget {
  const _Shelf({
    required this.title,
    required this.subtitle,
    required this.entries,
    this.onOpenFeatured,
  });

  final String title;
  final String subtitle;
  final List<_ShelfEntry> entries;
  final VoidCallback? onOpenFeatured;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ShelfHeader(title: title, subtitle: subtitle),
        const SizedBox(height: 14),
        SizedBox(
          height: 244,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: entries.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final entry = entries[index];

              return _ShelfBook(
                entry: entry,
                onTap: entry.opensFeaturedArticle ? onOpenFeatured : null,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ShelfHeader extends StatelessWidget {
  const _ShelfHeader({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 31,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.muted,
                      fontSize: 10,
                    ),
              ),
            ],
          ),
        ),
        Text(
          'VER TODOS →',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.blue,
                fontSize: 9,
                letterSpacing: .6,
              ),
        ),
      ],
    );
  }
}

class _ShelfBook extends StatelessWidget {
  const _ShelfBook({
    required this.entry,
    this.onTap,
  });

  final _ShelfEntry entry;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 138,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KnowledgeCover(
            title: entry.title,
            kicker: entry.category,
            style: entry.style,
            width: 132,
            height: 184,
            onTap: onTap,
          ),
          const SizedBox(height: 9),
          Text(
            entry.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 11,
                ),
          ),
          const SizedBox(height: 2),
          Text(
            entry.minutes,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 9,
                  color: AppColors.muted,
                ),
          ),
        ],
      ),
    );
  }
}

class _ContinueShelf extends StatelessWidget {
  const _ContinueShelf();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ShelfHeader(
          title: 'continue daqui',
          subtitle: 'seu histórico recente',
        ),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
          decoration: BoxDecoration(
            color: AppColors.paperWhite,
            border: Border.all(color: AppColors.ink),
          ),
          child: Row(
            children: [
              const KnowledgeCover(
                title: 'Modernismo',
                kicker: 'Arquitetura',
                style: KnowledgeCoverStyle.archive,
                width: 82,
                height: 112,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Modernismo: quando o mundo resolveu parecer moderno',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 16,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Arquitetura · 8 min',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.muted,
                            fontSize: 10,
                          ),
                    ),
                    const SizedBox(height: 12),
                    const LinearProgressIndicator(
                      value: .46,
                      minHeight: 5,
                      color: AppColors.blue,
                      backgroundColor: AppColors.line,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '46% lido',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: AppColors.blue,
                            fontSize: 9,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RabbitHoleShelf extends StatelessWidget {
  const _RabbitHoleShelf();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
      decoration: BoxDecoration(
        color: AppColors.deepBlue,
        border: Border.all(color: AppColors.ink),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'RABBIT HOLE ATUAL',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.white60,
                  fontSize: 9,
                  letterSpacing: 1.1,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            'Bauhaus → Modernismo → Brasília → Niemeyer',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.white,
                  fontSize: 30,
                  height: 1.05,
                ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Text(
                '4 conexões',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Colors.white70,
                      fontSize: 10,
                    ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}

class _ShelfEntry {
  const _ShelfEntry({
    required this.title,
    required this.category,
    required this.minutes,
    required this.style,
    this.opensFeaturedArticle = false,
  });

  final String title;
  final String category;
  final String minutes;
  final KnowledgeCoverStyle style;
  final bool opensFeaturedArticle;
}
