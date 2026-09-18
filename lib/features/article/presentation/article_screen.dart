import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../core/widgets/editorial_decorations.dart';
import '../../../core/widgets/editorial_frame.dart';
import '../../../core/widgets/editorial_rule.dart';
import '../../../core/widgets/paper_texture.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key, required this.topic});

  final KnowledgeTopic topic;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final ScrollController _scrollController = ScrollController();
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateProgress);
  }

  void _updateProgress() {
    if (!_scrollController.hasClients) {
      return;
    }

    final extent = _scrollController.position.maxScrollExtent;
    final next = extent <= 0
        ? 0.0
        : (_scrollController.offset / extent).clamp(0.0, 1.0);

    if ((next - _progress).abs() > .005 && mounted) {
      setState(() => _progress = next);
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_updateProgress)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topic = widget.topic;
    final nextTopic = nextDemoTopic(topic);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ler'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: LinearProgressIndicator(
            value: _progress,
            minHeight: 2,
            color: AppColors.blue,
            backgroundColor: AppColors.line,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Salvar',
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: PaperTexture(
        child: SelectionArea(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: EditorialFrame(
              maxWidth: 720,
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 56),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ArticleHeader(topic: topic),
                  const SizedBox(height: 40),
                  _Section(
                    number: '01',
                    title: 'em 30 segundos',
                    child: _Highlight(
                      text: topic.quickTake,
                      note: 'guarde isso',
                    ),
                  ),
                  _Section(
                    number: '02',
                    title: 'entenda de verdade',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...topic.body.indexed.map(
                          (item) => _BodyParagraph(
                            index: item.$1,
                            text: item.$2,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const _MarginNote(
                          text:
                              'repare como uma escola que durou só 14 anos continua aparecendo em tudo.',
                        ),
                      ],
                    ),
                  ),
                  _Section(
                    number: '03',
                    title: 'o que você precisa lembrar',
                    child: Column(
                      children: topic.remember.indexed
                          .map(
                            (item) => _RememberRow(
                              number:
                                  (item.$1 + 1).toString().padLeft(2, '0'),
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
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 17,
                          ),
                    ),
                  ),
                  _Section(
                    number: '05',
                    title: 'uma coisa interessante',
                    child: _Highlight(
                      text: topic.curiosity,
                      note: 'boa pra contar',
                    ),
                  ),
                  _Section(
                    number: '06',
                    title: 'conecte os pontos',
                    child: _Connections(connections: topic.connections),
                  ),
                  _ArticleEnd(nextTopic: nextTopic),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ArticleHeader extends StatelessWidget {
  const _ArticleHeader({required this.topic});

  final KnowledgeTopic topic;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 620;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  topic.tags.join(' · ').toUpperCase(),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.blue,
                        letterSpacing: 1.3,
                      ),
                ),
                const Spacer(),
                Text(
                  '${topic.minutes} MIN',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.muted,
                        fontSize: 11,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            const EditorialRule(width: 74),
            const SizedBox(height: 22),
            Stack(
              clipBehavior: Clip.none,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: wide ? 650 : double.infinity,
                  ),
                  child: Text(
                    topic.title,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: wide ? 72 : 54,
                          height: .93,
                        ),
                  ),
                ),
                if (wide)
                  const Positioned(
                    right: 4,
                    bottom: 4,
                    child: DoodleAsterisk(size: 32),
                  ),
              ],
            ),
            const SizedBox(height: 24),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 620),
              child: Text(
                topic.summary,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: wide ? 19 : 17,
                      height: 1.55,
                    ),
              ),
            ),
            const SizedBox(height: 24),
            const Row(
              children: [
                HandNote(
                  'leia sem pressa →',
                  fontSize: 21,
                  color: AppColors.ink,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DoodleArrow(
                    width: 70,
                    height: 30,
                    color: AppColors.blue,
                  ),
                ),
              ],
            ),
          ],
        );
      },
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
      padding: const EdgeInsets.only(bottom: 46),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 38,
                height: 38,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.blue,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  number,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DoodleUnderline(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          child,
        ],
      ),
    );
  }
}

class _Highlight extends StatelessWidget {
  const _Highlight({
    required this.text,
    required this.note,
  });

  final String text;
  final String note;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 26, 20, 20),
          decoration: BoxDecoration(
            color: AppColors.softBlue,
            border: Border.all(color: AppColors.ink),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
          ),
        ),
        const Positioned(
          top: -10,
          left: 28,
          child: PaperTape(width: 82, height: 19),
        ),
        Positioned(
          right: 12,
          bottom: -13,
          child: Transform.rotate(
            angle: -.04,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.paperWhite,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: HandNote(
                  note,
                  fontSize: 19,
                  color: AppColors.ink,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BodyParagraph extends StatelessWidget {
  const _BodyParagraph({
    required this.index,
    required this.text,
  });

  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (index == 0)
            Padding(
              padding: const EdgeInsets.only(right: 12, top: 2),
              child: Text(
                text.substring(0, 1),
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: AppColors.blue,
                      fontSize: 58,
                      height: .85,
                    ),
              ),
            ),
          Expanded(
            child: Text(
              index == 0 ? text.substring(1) : text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 17,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MarginNote extends StatelessWidget {
  const _MarginNote({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Transform.rotate(
        angle: .025,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 310),
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: AppColors.ink),
              bottom: BorderSide(color: AppColors.ink),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DoodleAsterisk(
                size: 22,
                color: AppColors.ink,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: HandNote(
                  text,
                  fontSize: 20,
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
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
      padding: const EdgeInsets.symmetric(vertical: 17),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.line)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 44,
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
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 16.5,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Connections extends StatelessWidget {
  const _Connections({required this.connections});

  final List<String> connections;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...connections.indexed.map(
          (item) => Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.ink)),
            ),
            child: Row(
              children: [
                Text(
                  '0${item.$1 + 1}',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.blue,
                      ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Text(
                    item.$2,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Icon(Icons.north_east, size: 18),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ArticleEnd extends StatelessWidget {
  const _ArticleEnd({required this.nextTopic});

  final KnowledgeTopic nextTopic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Column(
        children: [
          const DoodleAsterisk(size: 34),
          const SizedBox(height: 12),
          const HandNote(
            'agora isso faz parte do seu repertório.',
            fontSize: 24,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Material(
            color: AppColors.deepBlue,
            child: InkWell(
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                  builder: (_) => ArticleScreen(topic: nextTopic),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 16, 16, 18),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PRÓXIMA CONEXÃO',
                            style:
                                Theme.of(context).textTheme.labelLarge?.copyWith(
                                      color: Colors.white60,
                                      fontSize: 9,
                                      letterSpacing: 1.1,
                                    ),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            nextTopic.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                          ),
                          const SizedBox(height: 7),
                          Text(
                            '${nextTopic.minutes} min · ${nextTopic.tags.first}',
                            style:
                                Theme.of(context).textTheme.labelLarge?.copyWith(
                                      color: Colors.white70,
                                      fontSize: 9,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
