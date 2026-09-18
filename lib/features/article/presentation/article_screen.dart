import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/state/app_state.dart';
import '../../../app/state/app_state_scope.dart';
import '../../../app/theme/app_colors.dart';
import '../../explore/data/knowledge_graph.dart';
import '../../explore/presentation/knowledge_map_screen.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';
import 'reader_controls_sheet.dart';
import 'topic_media_section.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({
    super.key,
    required this.topic,
  });

  final KnowledgeTopic topic;

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final ScrollController _scrollController = ScrollController();
  PageController? _pageController;
  double _progress = 0;
  bool _bootstrapped = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_bootstrapped) {
      return;
    }
    _bootstrapped = true;

    final state = AppStateScope.read(context);
    _progress = state.progressFor(widget.topic.id);
    state.openTopic(widget.topic.id);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scrollController.hasClients) {
        return;
      }
      final extent = _scrollController.position.maxScrollExtent;
      if (extent > 0 && _progress > .03) {
        _scrollController.jumpTo(extent * _progress.clamp(0.0, .96));
      }
    });
  }

  void _onScroll() {
    if (!_scrollController.hasClients) {
      return;
    }
    final extent = _scrollController.position.maxScrollExtent;
    if (extent <= 0) {
      return;
    }
    final next =
        (_scrollController.offset / extent).clamp(0.0, 1.0).toDouble();
    if ((next - _progress).abs() >= .01) {
      setState(() => _progress = next);
    }
    AppStateScope.read(context).updateProgress(widget.topic.id, next);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final palette = _ReaderPalette.fromMode(state.readerTheme);
    final bodyStyle = _bodyStyle(state, palette);
    final nextTopic = _nextTopic(widget.topic);
    final saved = state.isSaved(widget.topic.id);

    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: palette.background,
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              backgroundColor: palette.background,
              foregroundColor: palette.text,
              surfaceTintColor: Colors.transparent,
            ),
      ),
      child: Scaffold(
        backgroundColor: palette.background,
        appBar: AppBar(
          title: Text(
            '${(_progress * 100).round()}%',
            style: TextStyle(
              color: palette.muted,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: .8,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2),
            child: LinearProgressIndicator(
              value: _progress,
              minHeight: 2,
              color: palette.accent,
              backgroundColor: palette.line,
            ),
          ),
          actions: [
            IconButton(
              tooltip: saved ? 'Remover dos salvos' : 'Salvar',
              onPressed: () =>
                  AppStateScope.read(context).toggleSaved(widget.topic.id),
              icon: Icon(
                saved ? Icons.bookmark : Icons.bookmark_border,
              ),
            ),
            IconButton(
              tooltip: 'Mapa',
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => KnowledgeMapScreen(
                    rootTopicId: widget.topic.id,
                  ),
                ),
              ),
              icon: const Icon(Icons.hub_outlined),
            ),
            TextButton(
              onPressed: () => showReaderControls(context),
              child: Text(
                'Aa',
                style: TextStyle(
                  color: palette.text,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(width: 4),
          ],
        ),
        body: state.readerFlow == ReaderFlow.paged
            ? _buildPagedReader(
                context,
                state,
                palette,
                bodyStyle,
                nextTopic,
              )
            : _buildContinuousReader(
                context,
                state,
                palette,
                bodyStyle,
                nextTopic,
              ),
      ),
    );
  }

  Widget _buildContinuousReader(
    BuildContext context,
    AppState state,
    _ReaderPalette palette,
    TextStyle bodyStyle,
    KnowledgeTopic nextTopic,
  ) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onDoubleTap: () => showReaderControls(context),
      child: SelectionArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 64),
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Header(
                    topic: widget.topic,
                    palette: palette,
                    bodyStyle: bodyStyle,
                  ),
                  const SizedBox(height: 42),
                  _Section(
                    number: '01',
                    title: 'em 30 segundos',
                    palette: palette,
                    child: _Highlight(
                      text: widget.topic.quickTake,
                      palette: palette,
                      bodyStyle: bodyStyle,
                    ),
                  ),
                  if (widget.topic.media.isNotEmpty) ...[
                    TopicMediaSection(media: widget.topic.media),
                    const SizedBox(height: 42),
                  ],
                  _Section(
                    number: '02',
                    title: 'entenda de verdade',
                    palette: palette,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (final paragraph in widget.topic.body)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 22),
                            child: Text(paragraph, style: bodyStyle),
                          ),
                      ],
                    ),
                  ),
                  _Section(
                    number: '03',
                    title: 'o que você precisa lembrar',
                    palette: palette,
                    child: Column(
                      children: widget.topic.remember.indexed
                          .map(
                            (item) => _RememberRow(
                              number:
                                  (item.$1 + 1).toString().padLeft(2, '0'),
                              text: item.$2,
                              palette: palette,
                              bodyStyle: bodyStyle,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  _Section(
                    number: '04',
                    title: 'por que isso importa',
                    palette: palette,
                    child: Text(
                      widget.topic.whyItMatters,
                      style: bodyStyle,
                    ),
                  ),
                  _Section(
                    number: '05',
                    title: 'uma coisa interessante',
                    palette: palette,
                    child: _Highlight(
                      text: widget.topic.curiosity,
                      palette: palette,
                      bodyStyle: bodyStyle,
                    ),
                  ),
                  _Section(
                    number: '06',
                    title: 'conecte os pontos',
                    palette: palette,
                    child: _Connections(
                      topic: widget.topic,
                      palette: palette,
                    ),
                  ),
                  _NextConnection(
                    nextTopic: nextTopic,
                    palette: palette,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPagedReader(
    BuildContext context,
    AppState state,
    _ReaderPalette palette,
    TextStyle bodyStyle,
    KnowledgeTopic nextTopic,
  ) {
    final pages = <Widget>[
      _Page(
        palette: palette,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(
              topic: widget.topic,
              palette: palette,
              bodyStyle: bodyStyle,
            ),
            const SizedBox(height: 30),
            _Section(
              number: '01',
              title: 'em 30 segundos',
              palette: palette,
              child: _Highlight(
                text: widget.topic.quickTake,
                palette: palette,
                bodyStyle: bodyStyle,
              ),
            ),
          ],
        ),
      ),
      if (widget.topic.media.isNotEmpty)
        _Page(
          palette: palette,
          child: TopicMediaSection(media: widget.topic.media),
        ),
      _Page(
        palette: palette,
        child: _Section(
          number: '02',
          title: 'entenda de verdade',
          palette: palette,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final paragraph in widget.topic.body)
                Padding(
                  padding: const EdgeInsets.only(bottom: 22),
                  child: Text(paragraph, style: bodyStyle),
                ),
            ],
          ),
        ),
      ),
      _Page(
        palette: palette,
        child: Column(
          children: [
            _Section(
              number: '03',
              title: 'o que você precisa lembrar',
              palette: palette,
              child: Column(
                children: widget.topic.remember.indexed
                    .map(
                      (item) => _RememberRow(
                        number:
                            (item.$1 + 1).toString().padLeft(2, '0'),
                        text: item.$2,
                        palette: palette,
                        bodyStyle: bodyStyle,
                      ),
                    )
                    .toList(),
              ),
            ),
            _Section(
              number: '04',
              title: 'por que isso importa',
              palette: palette,
              child: Text(widget.topic.whyItMatters, style: bodyStyle),
            ),
          ],
        ),
      ),
      _Page(
        palette: palette,
        child: Column(
          children: [
            _Section(
              number: '05',
              title: 'uma coisa interessante',
              palette: palette,
              child: _Highlight(
                text: widget.topic.curiosity,
                palette: palette,
                bodyStyle: bodyStyle,
              ),
            ),
            _Section(
              number: '06',
              title: 'conecte os pontos',
              palette: palette,
              child: _Connections(
                topic: widget.topic,
                palette: palette,
              ),
            ),
            _NextConnection(
              nextTopic: nextTopic,
              palette: palette,
            ),
          ],
        ),
      ),
    ];

    _pageController ??= PageController(
      initialPage:
          (_progress * (pages.length - 1)).round().clamp(0, pages.length - 1),
    );

    return Stack(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onDoubleTap: () => showReaderControls(context),
          child: PageView.builder(
            controller: _pageController,
            itemCount: pages.length,
            onPageChanged: (index) {
              final next = (index + 1) / pages.length;
              setState(() => _progress = next);
              state.updateProgress(widget.topic.id, next);
            },
            itemBuilder: (_, index) => pages[index],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 12,
          child: IgnorePointer(
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                color: palette.surface.withValues(alpha: .92),
                child: Text(
                  'deslize para virar a página',
                  style: TextStyle(
                    color: palette.muted,
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .6,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  TextStyle _bodyStyle(AppState state, _ReaderPalette palette) {
    final base = state.readerFont == ReaderFontFamily.editorial
        ? GoogleFonts.literata()
        : GoogleFonts.manrope();

    return base.copyWith(
      color: palette.text,
      fontSize: state.readerFontSize,
      height: state.readerLineHeight,
      fontWeight: FontWeight.w400,
    );
  }

  KnowledgeTopic _nextTopic(KnowledgeTopic topic) {
    final ids = neighborsFor(topic.id);
    if (ids.isNotEmpty) {
      final connected = topicById(ids.first);
      if (connected != null) {
        return connected;
      }
    }
    return nextDemoTopic(topic);
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.topic,
    required this.palette,
    required this.bodyStyle,
  });

  final KnowledgeTopic topic;
  final _ReaderPalette palette;
  final TextStyle bodyStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topic.tags.join(' · ').toUpperCase(),
          style: TextStyle(
            color: palette.accent,
            fontSize: 10,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          topic.title,
          style: GoogleFonts.instrumentSerif(
            color: palette.text,
            fontSize: 52,
            height: .94,
            letterSpacing: -1.5,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          topic.summary,
          style: bodyStyle.copyWith(
            fontSize: bodyStyle.fontSize! + 1,
            color: palette.muted,
          ),
        ),
        const SizedBox(height: 18),
        Row(
          children: [
            Text(
              '${topic.minutes} MIN',
              style: TextStyle(
                color: palette.accent,
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Divider(color: palette.line),
            ),
          ],
        ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.number,
    required this.title,
    required this.palette,
    required this.child,
  });

  final String number;
  final String title;
  final _ReaderPalette palette;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 44),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                color: palette.accent,
                child: Text(
                  number,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.manrope(
                    color: palette.text,
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -.6,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }
}

class _Highlight extends StatelessWidget {
  const _Highlight({
    required this.text,
    required this.palette,
    required this.bodyStyle,
  });

  final String text;
  final _ReaderPalette palette;
  final TextStyle bodyStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: palette.highlight,
        border: Border(
          left: BorderSide(
            color: palette.accent,
            width: 4,
          ),
        ),
      ),
      child: Text(
        text,
        style: bodyStyle.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _RememberRow extends StatelessWidget {
  const _RememberRow({
    required this.number,
    required this.text,
    required this.palette,
    required this.bodyStyle,
  });

  final String number;
  final String text;
  final _ReaderPalette palette;
  final TextStyle bodyStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: palette.line),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 42,
            child: Text(
              number,
              style: TextStyle(
                color: palette.accent,
                fontSize: 10,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Expanded(child: Text(text, style: bodyStyle)),
        ],
      ),
    );
  }
}

class _Connections extends StatelessWidget {
  const _Connections({
    required this.topic,
    required this.palette,
  });

  final KnowledgeTopic topic;
  final _ReaderPalette palette;

  @override
  Widget build(BuildContext context) {
    final linked = neighborsFor(topic.id)
        .map(topicById)
        .whereType<KnowledgeTopic>()
        .toList();

    return Column(
      children: [
        if (linked.isNotEmpty)
          ...linked.map(
            (connected) => InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => ArticleScreen(topic: connected),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: palette.line),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        connected.title,
                        style: TextStyle(
                          color: palette.text,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.north_east,
                      size: 18,
                      color: palette.text,
                    ),
                  ],
                ),
              ),
            ),
          ),
        const SizedBox(height: 14),
        OutlinedButton.icon(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => KnowledgeMapScreen(
                rootTopicId: topic.id,
              ),
            ),
          ),
          icon: const Icon(Icons.hub_outlined),
          label: const Text('abrir mapa'),
          style: OutlinedButton.styleFrom(
            foregroundColor: palette.text,
            side: BorderSide(color: palette.text),
          ),
        ),
      ],
    );
  }
}

class _NextConnection extends StatelessWidget {
  const _NextConnection({
    required this.nextTopic,
    required this.palette,
  });

  final KnowledgeTopic nextTopic;
  final _ReaderPalette palette;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: palette.nextCard,
      child: InkWell(
        onTap: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (_) => ArticleScreen(topic: nextTopic),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 16, 20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'PRÓXIMA CONEXÃO',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      nextTopic.title,
                      style: GoogleFonts.instrumentSerif(
                        color: Colors.white,
                        fontSize: 26,
                        height: 1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${nextTopic.minutes} min · ${nextTopic.tags.first}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
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
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({
    required this.palette,
    required this.child,
  });

  final _ReaderPalette palette;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 70),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: child,
        ),
      ),
    );
  }
}

class _ReaderPalette {
  const _ReaderPalette({
    required this.background,
    required this.surface,
    required this.text,
    required this.muted,
    required this.line,
    required this.accent,
    required this.highlight,
    required this.nextCard,
  });

  final Color background;
  final Color surface;
  final Color text;
  final Color muted;
  final Color line;
  final Color accent;
  final Color highlight;
  final Color nextCard;

  factory _ReaderPalette.fromMode(ReaderThemeMode mode) {
    switch (mode) {
      case ReaderThemeMode.paper:
        return const _ReaderPalette(
          background: AppColors.paper,
          surface: AppColors.paperWhite,
          text: AppColors.ink,
          muted: AppColors.muted,
          line: AppColors.line,
          accent: AppColors.blue,
          highlight: AppColors.softBlue,
          nextCard: AppColors.deepBlue,
        );
      case ReaderThemeMode.sepia:
        return const _ReaderPalette(
          background: Color(0xFFE9DFC9),
          surface: Color(0xFFF4EBD8),
          text: Color(0xFF2A251F),
          muted: Color(0xFF756B5F),
          line: Color(0xFFCBBDA4),
          accent: Color(0xFF3A4F85),
          highlight: Color(0xFFD8D7CF),
          nextCard: Color(0xFF263860),
        );
      case ReaderThemeMode.dark:
        return const _ReaderPalette(
          background: Color(0xFF111111),
          surface: Color(0xFF1C1C1C),
          text: Color(0xFFF3EFE6),
          muted: Color(0xFFAAA59B),
          line: Color(0xFF383838),
          accent: Color(0xFF7894DD),
          highlight: Color(0xFF222C45),
          nextCard: Color(0xFF17254C),
        );
    }
  }
}
