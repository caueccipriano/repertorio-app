import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../article/presentation/article_screen.dart';
import '../../article/presentation/quick_peek.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<KnowledgeTopic> get _results {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) {
      return allDemoTopics;
    }

    return allDemoTopics.where((topic) {
      final haystack = [
        topic.title,
        topic.summary,
        ...topic.tags,
        ...topic.connections,
        topic.quickTake,
      ].join(' ').toLowerCase();
      return haystack.contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final results = _results;

    return Scaffold(
      appBar: AppBar(title: const Text('buscar')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
          children: [
            TextField(
              controller: _controller,
              autofocus: true,
              onChanged: (value) => setState(() => _query = value),
              decoration: InputDecoration(
                hintText: 'Roma, vinho, Bauhaus, inflação…',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _query.isEmpty
                    ? null
                    : IconButton(
                        onPressed: () {
                          _controller.clear();
                          setState(() => _query = '');
                        },
                        icon: const Icon(Icons.close),
                      ),
                filled: true,
                fillColor: AppColors.paperWhite,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.ink),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.ink),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.blue,
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Text(
              _query.isEmpty
                  ? 'TODO O ACERVO'
                  : '${results.length} RESULTADO${results.length == 1 ? '' : 'S'}',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.muted,
                    fontSize: 10,
                    letterSpacing: 1.1,
                  ),
            ),
            const SizedBox(height: 8),
            if (results.isEmpty)
              const _EmptySearch()
            else
              ...results.map(
                (topic) => _SearchResult(
                  topic: topic,
                  onOpen: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => ArticleScreen(topic: topic),
                    ),
                  ),
                  onPeek: () => showQuickPeek(context, topic),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SearchResult extends StatelessWidget {
  const _SearchResult({
    required this.topic,
    required this.onOpen,
    required this.onPeek,
  });

  final KnowledgeTopic topic;
  final VoidCallback onOpen;
  final VoidCallback onPeek;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onOpen,
      onLongPress: onPeek,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.line),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42,
              height: 56,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.blue,
              ),
              child: Text(
                topic.minutes.toString(),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topic.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 16,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    topic.tags.join(' · '),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppColors.muted,
                          fontSize: 9,
                        ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward, size: 18),
          ],
        ),
      ),
    );
  }
}

class _EmptySearch extends StatelessWidget {
  const _EmptySearch();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 36),
      child: Text(
        'Nada por aqui ainda. Tente outro termo.',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
