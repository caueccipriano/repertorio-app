import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../core/widgets/editorial_rule.dart';
import '../../today/domain/knowledge_topic.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key, required this.topic});

  final KnowledgeTopic topic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.paper,
        scrolledUnderElevation: 0,
        title: const Text('ler'),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.bookmark_border),
          ),
          SizedBox(width: 6),
        ],
      ),
      body: SelectionArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 48),
          children: [
            Text(
              topic.tags.join(' · ').toUpperCase(),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.blue,
                    letterSpacing: 1.3,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              topic.title,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 20),
            Text(
              topic.summary,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 18,
                  ),
            ),
            const SizedBox(height: 26),
            const EditorialRule(width: 88),
            const SizedBox(height: 34),
            _Section(
              number: '01',
              title: 'em 30 segundos',
              child: _Highlight(text: topic.quickTake),
            ),
            _Section(
              number: '02',
              title: 'entenda de verdade',
              child: Column(
                children: topic.body
                    .map(
                      (paragraph) => Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: Text(
                          paragraph,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            _Section(
              number: '03',
              title: 'o que você precisa lembrar',
              child: Column(
                children: topic.remember.indexed
                    .map(
                      (item) => _RememberRow(
                        number: (item.$1 + 1).toString().padLeft(2, '0'),
                        text: item.$2,
                      ),
                    )
                    .toList(),
              ),
            ),
            _Section(
              number: '04',
              title: 'por que isso importa',
              child: Text(
                topic.whyItMatters,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            _Section(
              number: '05',
              title: 'uma coisa interessante',
              child: _Highlight(text: topic.curiosity),
            ),
            _Section(
              number: '06',
              title: 'conecte os pontos',
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: topic.connections
                    .map(
                      (connection) => Chip(
                        label: Text(connection),
                        backgroundColor: AppColors.paperWhite,
                        side: const BorderSide(color: AppColors.ink),
                        shape: const StadiumBorder(),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.number,
    required this.title,
    required this.child,
  });

  final String number;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 38),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                number,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.blue,
                    ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class _Highlight extends StatelessWidget {
  const _Highlight({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.softBlue,
        border: Border(
          left: BorderSide(color: AppColors.blue, width: 4),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

class _RememberRow extends StatelessWidget {
  const _RememberRow({required this.number, required this.text});

  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.line)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 42,
            child: Text(
              number,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.blue,
                  ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
