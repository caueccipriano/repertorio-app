import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/app_shell.dart';
import '../../../app/state/app_state.dart';
import '../../../app/state/app_state_scope.dart';
import '../../../app/theme/app_colors.dart';
import '../../../core/audio/podcast_audio.dart';
import '../../../core/offline/offline_cache.dart';
import '../../../core/share/knowledge_card_share.dart';
import '../../explore/data/knowledge_graph.dart';
import '../../explore/presentation/knowledge_map_screen.dart';
import '../../study/data/study_content.dart';
import '../../study/presentation/quiz_screen.dart';
import '../../today/data/demo_topics.dart';
import '../../today/domain/knowledge_topic.dart';
import 'reader_controls_sheet.dart';
import 'topic_media_section.dart';

enum _ReaderMenuAction {
  save,
  queue,
  offline,
  note,
  share,
  map,
}

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
    if (_bootstrapped) return;
    _bootstrapped = true;

    final state = AppStateScope.read(context);
    _progress = state.progressFor(widget.topic.id);
    state.openTopic(widget.topic.id);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_scrollController.hasClients) return;
      final extent = _scrollController.position.maxScrollExtent;
      if (extent > 0 && _progress > .03) {
        _scrollController.jumpTo(extent * _progress.clamp(0.0, .96));
      }
    });
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final extent = _scrollController.position.maxScrollExtent;
    if (extent <= 0) return;

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
    final palette = _ReaderPalette.fromMode(
      state.readerTheme,
      highContrast: state.highContrast,
    );
    final bodyStyle = _bodyStyle(state, palette);
    final nextTopic = _nextTopic(widget.topic);
    final saved = state.isSaved(widget.topic.id);
    final queued = state.isQueued(widget.topic.id);
    final offline = state.isOfflineTopic(widget.topic.id);
    final note = state.noteFor(widget.topic.id);
    final audioMedia = _audioFor(widget.topic);
    final remaining = ((1 - _progress) * widget.topic.minutes)
        .ceil()
        .clamp(0, widget.topic.minutes);

    final sections = _buildSections(
      context,
      state,
      palette,
      bodyStyle,
      nextTopic,
    );

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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(58),
          child: SafeArea(
            bottom: false,
            child: Material(
              color: palette.background,
              child: Column(
                children: [
                  SizedBox(
                    height: 56,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 56,
                          height: 56,
                          child: InkWell(
                            key: const ValueKey('reader-back'),
                            onTap: _goBack,
                            child: const Center(
                              child: Text('‹', style: TextStyle(fontSize: 38, fontWeight: FontWeight.w400, height: 1)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              '${(_progress * 100).round()}% · $remaining min',
                              style: TextStyle(color: palette.muted, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: .7),
                            ),
                          ),
                        ),
                        if (audioMedia != null)
                          SizedBox(
                            width: 64,
                            height: 56,
                            child: InkWell(
                              key: const ValueKey('reader-audio'),
                              onTap: () => _openAudio(audioMedia),
                              child: const Center(child: Text('ÁUDIO', style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800))),
                            ),
                          ),
                        SizedBox(
                          width: 56,
                          height: 56,
                          child: InkWell(
                            key: const ValueKey('reader-settings'),
                            onTap: () => showReaderControls(context),
                            child: Center(child: Text('Aa', style: TextStyle(color: palette.text, fontSize: 16, fontWeight: FontWeight.w800))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  LinearProgressIndicator(value: _progress, minHeight: 2, color: palette.accent, backgroundColor: palette.line),
                ],
              ),
            ),
          ),
        ),
        body: state.readerFlow == ReaderFlow.paged
            ? _buildPagedReader(state, palette, sections)
            : _buildContinuousReader(state, palette, sections),
      ),
    );
  }

  List<Widget> _buildSections(
    BuildContext context,
    AppState state,
    _ReaderPalette palette,
    TextStyle bodyStyle,
    KnowledgeTopic nextTopic,
  ) {
    final depth = state.readerDepth;
    final standard = depth.index >= ContentDepth.standard.index;
    final deep = depth.index >= ContentDepth.deep.index;
    final immersion = depth == ContentDepth.immersion;
    final topic = widget.topic;

    final sections = <Widget>[
      _Header(
        topic: topic,
        palette: palette,
        bodyStyle: bodyStyle,
        depth: depth,
      ),
      const SizedBox(height: 38),
      _Section(
        number: '01',
        title: 'em 30 segundos',
        palette: palette,
        child: _PassageBlock(
          topicId: topic.id,
          passageId: 'quick',
          text: topic.quickTake,
          palette: palette,
          bodyStyle: bodyStyle.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    ];

    if (depth == ContentDepth.quick) {
      sections.addAll([
        _RememberSection(
          topic: topic,
          palette: palette,
          bodyStyle: bodyStyle,
          number: '02',
        ),
        _NextConnection(nextTopic: nextTopic, palette: palette),
      ]);
      return sections;
    }

    if (standard &&
        (topic.simpleExplanation != null || topic.example != null)) {
      sections.add(
        _Section(
          number: '02',
          title: 'explicando sem complicar',
          palette: palette,
          child: _SimpleExplanationBlock(
            explanation: topic.simpleExplanation,
            example: topic.example,
            palette: palette,
            bodyStyle: bodyStyle,
          ),
        ),
      );
    }

    if (topic.media.isNotEmpty && deep) {
      sections.addAll([
        TopicMediaSection(media: topic.media),
        const SizedBox(height: 38),
      ]);
    }

    if (standard) {
      sections.add(
        _Section(
          number: '03',
          title: 'entenda de verdade',
          palette: palette,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: topic.body.indexed
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _PassageBlock(
                      topicId: topic.id,
                      passageId: 'body:${item.$1}',
                      text: item.$2,
                      palette: palette,
                      bodyStyle: bodyStyle,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      );
      sections.add(
        _RememberSection(
          topic: topic,
          palette: palette,
          bodyStyle: bodyStyle,
        ),
      );
      sections.add(
        _Section(
          number: '05',
          title: 'por que isso importa',
          palette: palette,
          child: _PassageBlock(
            topicId: topic.id,
            passageId: 'why',
            text: topic.whyItMatters,
            palette: palette,
            bodyStyle: bodyStyle,
          ),
        ),
      );
    }

    if (deep) {
      sections.add(
        _Section(
          number: '06',
          title: 'uma coisa interessante',
          palette: palette,
          child: _PassageBlock(
            topicId: topic.id,
            passageId: 'curiosity',
            text: topic.curiosity,
            palette: palette,
            bodyStyle: bodyStyle,
          ),
        ),
      );

      final glossary = glossaryFor(topic.id);
      if (glossary.isNotEmpty) {
        sections.add(
          _Section(
            number: '07',
            title: 'glossário',
            palette: palette,
            child: _GlossarySection(
              entries: glossary,
              palette: palette,
            ),
          ),
        );
      }

      sections.add(
        _Section(
          number: '08',
          title: 'conecte os pontos',
          palette: palette,
          child: _Connections(
            topic: topic,
            palette: palette,
          ),
        ),
      );
    }

    if (immersion) {
      final entities = entitiesForTopic(topic.id);
      if (entities.isNotEmpty) {
        sections.add(
          _Section(
            number: '09',
            title: 'pessoas · lugares · ideias',
            palette: palette,
            child: _EntitySection(
              entities: entities,
              palette: palette,
            ),
          ),
        );
      }

      final sources = sourcesFor(topic.id);
      if (sources.isNotEmpty) {
        sections.add(
          _Section(
            number: '10',
            title: 'fontes e aprofundamento',
            palette: palette,
            child: _SourcesSection(
              sources: sources,
              palette: palette,
            ),
          ),
        );
      }
    }

    if (standard) {
      sections.add(
        _ExplainCard(
          explanation: state.explanationFor(topic.id),
          palette: palette,
          onEdit: () => _showExplanationSheet(
            state.explanationFor(topic.id),
          ),
        ),
      );
      sections.add(const SizedBox(height: 14));

      if (quizFor(topic.id).isNotEmpty) {
        sections.add(
          _QuizCard(
            topic: topic,
            score: state.quizScoreByTopic[topic.id],
            total: state.quizTotalByTopic[topic.id],
            palette: palette,
          ),
        );
        sections.add(const SizedBox(height: 14));
      }
    }

    sections.add(
      _PersonalNote(
        note: state.noteFor(topic.id),
        palette: palette,
        onEdit: () => _showNoteSheet(state.noteFor(topic.id)),
      ),
    );
    sections.add(const SizedBox(height: 18));
    sections.add(
      _AboutContent(
        topic: topic,
        palette: palette,
        offline: state.isOfflineTopic(topic.id),
      ),
    );
    sections.add(const SizedBox(height: 28));
    sections.add(
      _NextConnection(
        nextTopic: nextTopic,
        palette: palette,
      ),
    );

    return sections;
  }

  Widget _buildContinuousReader(
    AppState state,
    _ReaderPalette palette,
    List<Widget> sections,
  ) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onDoubleTap: () => showReaderControls(context),
      child: SelectionArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: EdgeInsets.fromLTRB(
            state.readerMargin,
            18,
            state.readerMargin,
            64,
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: state.readerColumnWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: sections,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPagedReader(
    AppState state,
    _ReaderPalette palette,
    List<Widget> sections,
  ) {
    final pages = sections
        .where((widget) => widget is! SizedBox)
        .map(
          (section) => _Page(
            palette: palette,
            columnWidth: state.readerColumnWidth,
            margin: state.readerMargin,
            child: section,
          ),
        )
        .toList();

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
        if (!state.readerFocusMode)
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
    final base = switch (state.readerFont) {
      ReaderFontFamily.editorial => GoogleFonts.literata(),
      ReaderFontFamily.sans => GoogleFonts.manrope(),
      ReaderFontFamily.readable => GoogleFonts.notoSans(),
    };

    return base.copyWith(
      color: palette.text,
      fontSize: state.readerFontSize,
      height: state.readerLineHeight,
      fontWeight: FontWeight.w400,
    );
  }

  KnowledgeMedia? _audioFor(KnowledgeTopic topic) {
    for (final media in topic.media) {
      if (media.type == KnowledgeMediaType.audio &&
          (media.url.startsWith('https://') ||
              media.url.startsWith('http://'))) {
        return media;
      }
    }
    return null;
  }

  Future<void> _openAudio(KnowledgeMedia media) async {
    final opened = await openPodcastAudio(
      url: media.url,
      title: media.title,
      source: media.sourceLabel ?? 'Podcast',
    );
    if (!mounted || opened) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Não consegui abrir o áudio dentro do Repertório.',
        ),
      ),
    );
  }

  void _goBack() {
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
      return;
    }

    navigator.pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => const AppShell(),
      ),
    );
  }

  PopupMenuItem<_ReaderMenuAction> _readerMenuItem(
    _ReaderMenuAction action,
    IconData icon,
    String label,
  ) {
    return PopupMenuItem<_ReaderMenuAction>(
      value: action,
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 12),
          Text(label),
        ],
      ),
    );
  }

  Future<void> _handleMenuAction(_ReaderMenuAction action) async {
    final state = AppStateScope.read(context);

    switch (action) {
      case _ReaderMenuAction.save:
        await _toggleSavedWithOffline();
        return;
      case _ReaderMenuAction.queue:
        await state.toggleReadLater(widget.topic.id);
        return;
      case _ReaderMenuAction.offline:
        await _toggleOffline();
        return;
      case _ReaderMenuAction.note:
        await _showNoteSheet(state.noteFor(widget.topic.id));
        return;
      case _ReaderMenuAction.share:
        await _shareLearning();
        return;
      case _ReaderMenuAction.map:
        if (!mounted) return;
        await Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => KnowledgeMapScreen(
              rootTopicId: widget.topic.id,
            ),
          ),
        );
        return;
    }
  }

  Future<void> _shareLearning() async {
    final shared = await shareKnowledgeCard(
      title: widget.topic.title,
      body: widget.topic.quickTake,
    );
    if (!mounted) return;

    if (shared) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Seu cartão editorial foi preparado.'),
        ),
      );
      return;
    }

    final text =
        '${widget.topic.title}\n\n${widget.topic.quickTake}\n\n— Repertório';
    await Clipboard.setData(ClipboardData(text: text));
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Imagem indisponível aqui; o conteúdo foi copiado como texto.',
        ),
      ),
    );
  }

  Future<void> _toggleSavedWithOffline() async {
    final state = AppStateScope.read(context);
    final topicId = widget.topic.id;

    if (state.isSaved(topicId)) {
      await state.toggleSaved(topicId);
      return;
    }

    final urls = widget.topic.media.map((item) => item.url).toList();
    final cached = urls.isEmpty ? true : await cacheOfflineMedia(urls);

    await state.toggleSaved(topicId);
    if (cached && !state.isOfflineTopic(topicId)) {
      await state.toggleOfflineTopic(topicId);
    }

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          cached
              ? 'Salvo na biblioteca e preparado para leitura offline.'
              : 'Salvo. O texto fica disponível; algumas mídias podem exigir internet.',
        ),
      ),
    );
  }

  Future<void> _toggleOffline() async {
    final state = AppStateScope.read(context);
    final topicId = widget.topic.id;
    final wasOffline = state.isOfflineTopic(topicId);
    final urls = widget.topic.media.map((item) => item.url).toList();

    if (wasOffline) {
      await removeOfflineMedia(urls);
      await state.toggleOfflineTopic(topicId);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Removido da biblioteca offline.')),
      );
      return;
    }

    final cached = urls.isEmpty
        ? true
        : await cacheOfflineMedia(urls);
    await state.toggleOfflineTopic(topicId);
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          cached
              ? 'Texto e mídia disponível foram preparados para offline.'
              : 'O texto fica offline; algumas mídias externas podem precisar de internet.',
        ),
      ),
    );
  }

  Future<void> _showNoteSheet(String currentNote) async {
    final result = await _textSheet(
      title: 'sua nota',
      subtitle:
          'Registre uma conexão, exemplo ou ideia que queira lembrar.',
      initial: currentNote,
      hint: 'O que vale lembrar? Que conexão você fez?',
      deleteLabel: 'apagar nota',
    );

    if (result == null || !mounted) return;
    await AppStateScope.read(context).saveNote(widget.topic.id, result);
  }

  Future<void> _showExplanationSheet(String current) async {
    final result = await _textSheet(
      title: 'explique com suas palavras',
      subtitle:
          'Tente explicar sem copiar o texto. Isso ajuda a descobrir se a ideia realmente ficou clara.',
      initial: current,
      hint: 'Como você explicaria isso para alguém?',
      deleteLabel: 'apagar resposta',
    );

    if (result == null || !mounted) return;
    await AppStateScope.read(context).saveExplanation(
      widget.topic.id,
      result,
    );
  }

  Future<String?> _textSheet({
    required String title,
    required String subtitle,
    required String initial,
    required String hint,
    required String deleteLabel,
  }) async {
    final controller = TextEditingController(text: initial);

    final result = await showModalBottomSheet<String>(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (sheetContext) {
        final bottom = MediaQuery.viewInsetsOf(sheetContext).bottom;
        return Padding(
          padding: EdgeInsets.fromLTRB(18, 18, 18, 20 + bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 7),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.muted,
                    ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller,
                autofocus: true,
                minLines: 5,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: hint,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  if (initial.isNotEmpty)
                    TextButton(
                      onPressed: () => Navigator.of(sheetContext).pop(''),
                      child: Text(deleteLabel),
                    ),
                  const Spacer(),
                  FilledButton(
                    onPressed: () =>
                        Navigator.of(sheetContext).pop(controller.text),
                    child: const Text('salvar'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );

    controller.dispose();
    return result;
  }

  KnowledgeTopic _nextTopic(KnowledgeTopic topic) {
    final ids = neighborsFor(topic.id);
    if (ids.isNotEmpty) {
      final connected = topicById(ids.first);
      if (connected != null) return connected;
    }
    return nextDemoTopic(topic);
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.topic,
    required this.palette,
    required this.bodyStyle,
    required this.depth,
  });

  final KnowledgeTopic topic;
  final _ReaderPalette palette;
  final TextStyle bodyStyle;
  final ContentDepth depth;

  @override
  Widget build(BuildContext context) {
    final depthLabel = switch (depth) {
      ContentDepth.quick => '30 SEGUNDOS',
      ContentDepth.standard => '5 MIN',
      ContentDepth.deep => '15 MIN',
      ContentDepth.immersion => 'MERGULHO FUNDO',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                topic.tags.join(' · ').toUpperCase(),
                style: TextStyle(
                  color: palette.accent,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            Text(
              depthLabel,
              style: TextStyle(
                color: palette.muted,
                fontSize: 9,
                fontWeight: FontWeight.w800,
                letterSpacing: .8,
              ),
            ),
          ],
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
      padding: const EdgeInsets.only(bottom: 42),
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
          const SizedBox(height: 18),
          child,
        ],
      ),
    );
  }
}

class _SimpleExplanationBlock extends StatelessWidget {
  const _SimpleExplanationBlock({
    required this.explanation,
    required this.example,
    required this.palette,
    required this.bodyStyle,
  });

  final String? explanation;
  final String? example;
  final _ReaderPalette palette;
  final TextStyle bodyStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border.all(color: palette.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (explanation case final text?) ...[
            Text(
              text,
              style: bodyStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
          if (example case final text?) ...[
            if (explanation != null) const SizedBox(height: 18),
            Text(
              'EXEMPLO SIMPLES',
              style: TextStyle(
                color: palette.accent,
                fontSize: 9,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.1,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              text,
              style: bodyStyle.copyWith(
                color: palette.muted,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _RememberSection extends StatelessWidget {
  const _RememberSection({
    required this.topic,
    required this.palette,
    required this.bodyStyle,
    this.number = '04',
  });

  final KnowledgeTopic topic;
  final _ReaderPalette palette;
  final TextStyle bodyStyle;
  final String number;

  @override
  Widget build(BuildContext context) {
    return _Section(
      number: number,
      title: 'o que você precisa lembrar',
      palette: palette,
      child: Column(
        children: topic.remember.indexed
            .map(
              (item) => _PassageBlock(
                topicId: topic.id,
                passageId: 'remember:${item.$1}',
                text: item.$2,
                palette: palette,
                bodyStyle: bodyStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                prefix:
                    (item.$1 + 1).toString().padLeft(2, '0'),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _PassageBlock extends StatelessWidget {
  const _PassageBlock({
    required this.topicId,
    required this.passageId,
    required this.text,
    required this.palette,
    required this.bodyStyle,
    this.prefix,
  });

  final String topicId;
  final String passageId;
  final String text;
  final _ReaderPalette palette;
  final TextStyle bodyStyle;
  final String? prefix;

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final highlighted = state.isHighlighted(topicId, passageId);
    final starred = state.isPassageStarred(topicId, passageId);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.fromLTRB(
        prefix == null ? 14 : 10,
        12,
        8,
        12,
      ),
      decoration: BoxDecoration(
        color: highlighted
            ? (state.readerTheme == ReaderThemeMode.dark
                ? const Color(0xFF594D19)
                : const Color(0xFFFFF0A8))
            : palette.surface,
        border: Border(
          left: BorderSide(
            color: highlighted ? palette.accent : palette.line,
            width: highlighted ? 4 : 1,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (prefix != null) ...[
            SizedBox(
              width: 34,
              child: Text(
                prefix!,
                style: TextStyle(
                  color: palette.accent,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
          Expanded(
            child: Text(
              text,
              textAlign:
                  state.readerAlignment == ReaderTextAlignment.justify
                      ? TextAlign.justify
                      : TextAlign.left,
              style: bodyStyle,
            ),
          ),
          Column(
            children: [
              IconButton(
                tooltip: highlighted
                    ? 'Remover marca-texto'
                    : 'Marcar trecho',
                visualDensity: VisualDensity.compact,
                onPressed: () =>
                    state.toggleHighlight(topicId, passageId),
                icon: Text(
                  highlighted ? '●' : '✎',
                  style: TextStyle(
                    fontSize: 18,
                    color: highlighted ? palette.accent : palette.muted,
                  ),
                ),
              ),
              IconButton(
                tooltip: starred
                    ? 'Desfavoritar trecho'
                    : 'Favoritar trecho',
                visualDensity: VisualDensity.compact,
                onPressed: () =>
                    state.togglePassageStar(topicId, passageId),
                icon: Text(
                  starred ? '★' : '☆',
                  style: TextStyle(
                    fontSize: 19,
                    color: starred ? palette.accent : palette.muted,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GlossarySection extends StatelessWidget {
  const _GlossarySection({
    required this.entries,
    required this.palette,
  });

  final List<GlossaryEntry> entries;
  final _ReaderPalette palette;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: entries
          .map(
            (entry) => ActionChip(
              label: Text(entry.term),
              onPressed: () => showModalBottomSheet<void>(
                context: context,
                useSafeArea: true,
                builder: (_) => Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.term,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        entry.definition,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
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

class _EntitySection extends StatelessWidget {
  const _EntitySection({
    required this.entities,
    required this.palette,
  });

  final List<KnowledgeEntity> entities;
  final _ReaderPalette palette;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: entities
          .map(
            (entity) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                border: Border.all(color: palette.line),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    entity.type == KnowledgeEntityType.person
                        ? Icons.person_outline
                        : entity.type == KnowledgeEntityType.place
                            ? Icons.place_outlined
                            : Icons.lightbulb_outline,
                    color: palette.accent,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entity.name,
                          style: TextStyle(
                            color: palette.text,
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          entity.summary,
                          style: TextStyle(
                            color: palette.muted,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _SourcesSection extends StatelessWidget {
  const _SourcesSection({
    required this.sources,
    required this.palette,
  });

  final List<SourceEntry> sources;
  final _ReaderPalette palette;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: sources
          .map(
            (source) => InkWell(
              onTap: () async {
                final uri = Uri.tryParse(source.url);
                if (uri != null) {
                  await launchUrl(
                    uri,
                    mode: LaunchMode.externalApplication,
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 13),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: palette.line),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            source.label,
                            style: TextStyle(
                              color: palette.text,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          if (source.note != null) ...[
                            const SizedBox(height: 3),
                            Text(
                              source.note!,
                              style: TextStyle(
                                color: palette.muted,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    Icon(
                      Icons.open_in_new,
                      size: 18,
                      color: palette.muted,
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ExplainCard extends StatelessWidget {
  const _ExplainCard({
    required this.explanation,
    required this.palette,
    required this.onEdit,
  });

  final String explanation;
  final _ReaderPalette palette;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: palette.surface,
      child: InkWell(
        onTap: onEdit,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            border: Border.all(color: palette.accent),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.record_voice_over_outlined, color: palette.accent),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'explique com suas palavras',
                      style: TextStyle(
                        color: palette.text,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      explanation.isEmpty
                          ? 'Se você consegue explicar sem olhar, a ideia já começou a virar repertório.'
                          : explanation,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: explanation.isEmpty
                            ? palette.muted
                            : palette.text,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.edit_outlined, color: palette.muted, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuizCard extends StatelessWidget {
  const _QuizCard({
    required this.topic,
    required this.score,
    required this.total,
    required this.palette,
  });

  final KnowledgeTopic topic;
  final int? score;
  final int? total;
  final _ReaderPalette palette;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: palette.nextCard,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => QuizScreen(topic: topic),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              const Icon(Icons.quiz_outlined, color: Colors.white),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'VOCÊ ENTENDEU?',
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 9,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      score == null || total == null
                          ? 'Faça um quiz rápido'
                          : 'Último resultado: $score/$total',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

class _PersonalNote extends StatelessWidget {
  const _PersonalNote({
    required this.note,
    required this.palette,
    required this.onEdit,
  });

  final String note;
  final _ReaderPalette palette;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: palette.surface,
      child: InkWell(
        onTap: onEdit,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            border: Border.all(color: palette.line),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                note.isEmpty
                    ? Icons.note_add_outlined
                    : Icons.sticky_note_2_outlined,
                color: palette.accent,
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.isEmpty ? 'adicione uma nota' : 'sua nota',
                      style: TextStyle(
                        color: palette.text,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      note.isEmpty
                          ? 'Registre uma conexão, exemplo ou ideia que queira lembrar.'
                          : note,
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: note.isEmpty ? palette.muted : palette.text,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.edit_outlined, color: palette.muted, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class _AboutContent extends StatelessWidget {
  const _AboutContent({
    required this.topic,
    required this.palette,
    required this.offline,
  });

  final KnowledgeTopic topic;
  final _ReaderPalette palette;
  final bool offline;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: palette.line),
      ),
      child: Wrap(
        spacing: 12,
        runSpacing: 8,
        children: [
          _Meta('revisão editorial · 2026', palette),
          _Meta('nível · essencial → profundo', palette),
          _Meta(
            offline ? 'texto offline · ativo' : 'texto offline · disponível',
            palette,
          ),
          _Meta('${sourcesFor(topic.id).length} fontes', palette),
        ],
      ),
    );
  }
}

class _Meta extends StatelessWidget {
  const _Meta(this.text, this.palette);

  final String text;
  final _ReaderPalette palette;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: palette.muted,
        fontSize: 9,
        fontWeight: FontWeight.w700,
      ),
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
              const Icon(Icons.arrow_forward, color: Colors.white),
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
    required this.columnWidth,
    required this.margin,
    required this.child,
  });

  final _ReaderPalette palette;
  final double columnWidth;
  final double margin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(margin, 22, margin, 70),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: columnWidth),
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
    required this.nextCard,
  });

  final Color background;
  final Color surface;
  final Color text;
  final Color muted;
  final Color line;
  final Color accent;
  final Color nextCard;

  factory _ReaderPalette.fromMode(
    ReaderThemeMode mode, {
    required bool highContrast,
  }) {
    if (highContrast && mode != ReaderThemeMode.dark) {
      return const _ReaderPalette(
        background: Colors.white,
        surface: Colors.white,
        text: Colors.black,
        muted: Color(0xFF444444),
        line: Colors.black,
        accent: Color(0xFF002F9E),
        nextCard: Color(0xFF001B60),
      );
    }

    switch (mode) {
      case ReaderThemeMode.paper:
        return const _ReaderPalette(
          background: AppColors.paper,
          surface: AppColors.paperWhite,
          text: AppColors.ink,
          muted: AppColors.muted,
          line: AppColors.line,
          accent: AppColors.blue,
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
          nextCard: Color(0xFF17254C),
        );
    }
  }
}
