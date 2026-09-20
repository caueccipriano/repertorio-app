import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/state/app_state.dart';
import '../../../app/state/app_state_scope.dart';
import '../../../core/share/knowledge_card_share.dart';
import '../../../core/widgets/editorial_frame.dart';
import '../../../core/widgets/paper_texture.dart';
import '../../today/data/demo_topics.dart';
import '../../viral/data/viral_score_focus.dart';
import '../../viral/presentation/viral_entry_gate.dart';
import 'accessibility_screen.dart';
import 'appearance_screen.dart';
import 'backup_screen.dart';
import 'notification_settings_screen.dart';
import 'notes_screen.dart';
import 'cultural_map.dart';
import 'cultural_area_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const _historyKey = 'viral_score_history_v1';
  static const _weakCategoriesKey = 'viral_score_weak_categories_v1';
  static const _strengthCategoriesKey = 'viral_score_strength_categories_v1';
  static const _scoreCategories = <String>[
    'PSICOLOGIA',
    'HISTÓRIA',
    'CIÊNCIA',
    'ECONOMIA',
    'ARTE & DESIGN',
    'TECNOLOGIA',
    'MUNDO',
    'CULTURA',
  ];

  List<_ProfileScoreSnapshot> _scoreHistory = const [];
  List<String> _weakCategories = const [];
  List<String> _strengthCategories = const [];

  @override
  void initState() {
    super.initState();
    _loadScoreProfile();
  }

  Future<void> _loadScoreProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final history = (prefs.getStringList(_historyKey) ?? const <String>[])
        .map(_ProfileScoreSnapshot.tryParse)
        .whereType<_ProfileScoreSnapshot>()
        .toList();

    if (!mounted) return;
    setState(() {
      _scoreHistory = history;
      _weakCategories =
          prefs.getStringList(_weakCategoriesKey) ?? const <String>[];
      _strengthCategories =
          prefs.getStringList(_strengthCategoriesKey) ?? const <String>[];
    });
  }

  Future<void> _shareProfile(Map<String, int> categoryCounts) async {
    if (_scoreHistory.isEmpty) return;
    final latest = _scoreHistory.first;
    final shareUri = Uri.base.replace(
      queryParameters: {
        'score': latest.score.toString(),
        'a': latest.archetype,
      },
    );

    final shared = await shareRepertoryProfile(
      score: latest.score,
      archetype: latest.archetype,
      strengths: _strengthCategories.join(' · '),
      countsJson: jsonEncode(categoryCounts),
      shareUrl: shareUri.toString(),
    );

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          shared
              ? 'Seu mapa de repertório está pronto para compartilhar.'
              : 'Não consegui abrir o compartilhamento neste dispositivo.',
        ),
      ),
    );
  }

  Future<void> _retakeScore() async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ViralEntryExperience(
          onEnterApp: (result) async {
            if (result != null) {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setInt('viral_score_v1', result.score);
              await prefs.setString('viral_archetype_v1', result.archetype);
            }
            if (!mounted) return;
            Navigator.of(context).pop();
          },
        ),
      ),
    );
    if (!mounted) return;
    await _loadScoreProfile();
  }

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final exploredIds = {
      ...state.historyTopicIds,
      ...state.completedTopicIds,
    };
    final categoryCounts = <String, int>{
      for (final category in _scoreCategories) category: 0,
    };

    for (final id in exploredIds) {
      final topic = topicById(id);
      if (topic == null) continue;
      final haystack = <String>{
        ...topic.tags.map(normalizeScoreText),
        normalizeScoreText(topic.eyebrow),
        normalizeScoreText(topic.title),
      }.join(' ');

      for (final category in _scoreCategories) {
        final tags = scoreTagsForCategory(category);
        if (tags.any(haystack.contains)) {
          categoryCounts[category] = (categoryCounts[category] ?? 0) + 1;
        }
      }
    }

    final totalRead = state.completedTopicIds.length;
    final totalSaved = state.savedTopicIds.length;
    final totalStarted = state.progressByTopic.values
        .where((progress) => progress > 0)
        .length;
    final rabbitHoles = state.historyTopicIds.length < 2
        ? 0
        : state.historyTopicIds.length - 1;
    final rankedAreas = categoryCounts.entries
        .where((entry) => entry.value > 0)
        .toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final strongestArea =
        rankedAreas.isEmpty ? null : _displayCategory(rankedAreas.first.key);
    final exploredScoreAreas =
        categoryCounts.values.where((count) => count > 0).length;
    final streak = _currentStreak(state.studyDays);
    final now = DateTime.now();
    final monthPrefix =
        '${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}-';
    final studiedDaysThisMonth =
        state.studyDays.where((day) => day.startsWith(monthPrefix)).length;
    final weekStart = DateTime(
      now.year,
      now.month,
      now.day,
    ).subtract(const Duration(days: 6));
    final weeklyTopicIds = state.lastOpenedByTopic.entries
        .where((entry) => !entry.value.isBefore(weekStart))
        .map((entry) => entry.key)
        .toSet();
    final weeklyCategoryCounts = <String, int>{
      for (final category in _scoreCategories) category: 0,
    };
    for (final id in weeklyTopicIds) {
      final topic = topicById(id);
      if (topic == null) continue;
      final haystack = <String>{
        ...topic.tags.map(normalizeScoreText),
        normalizeScoreText(topic.eyebrow),
        normalizeScoreText(topic.title),
      }.join(' ');
      for (final category in _scoreCategories) {
        if (scoreTagsForCategory(category).any(haystack.contains)) {
          weeklyCategoryCounts[category] =
              (weeklyCategoryCounts[category] ?? 0) + 1;
        }
      }
    }
    final weeklyRanked = weeklyCategoryCounts.entries
        .where((entry) => entry.value > 0)
        .toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final weeklyTopCategory =
        weeklyRanked.isEmpty ? null : weeklyRanked.first.key;
    final weeklyActiveDays = state.studyDays
        .map(DateTime.tryParse)
        .whereType<DateTime>()
        .where((date) => !date.isBefore(weekStart))
        .length;
    final weeklyConnections = state.personalConnections
        .where((connection) => !connection.createdAt.isBefore(weekStart))
        .length;

    return PaperTexture(
      child: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: EditorialFrame(
            maxWidth: 760,
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RETRATO DO SEU CONHECIMENTO',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 9,
                        letterSpacing: 1.2,
                      ),
                ),
                const SizedBox(height: 7),
                Text(
                  'seu repertório',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Aqui só entra o que você realmente leu, salvou ou explorou.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: 24),
                if (_scoreHistory.isNotEmpty) ...[
                  _ScorePortrait(
                    history: _scoreHistory,
                    strengths: _strengthCategories,
                    weakCategories: _weakCategories,
                    onRetake: _retakeScore,
                    onShare: () => _shareProfile(categoryCounts),
                  ),
                  const SizedBox(height: 12),
                  _CulturalPassport(
                    score: _scoreHistory.first.score,
                    archetype: _scoreHistory.first.archetype,
                    strongestArea: strongestArea,
                    exploredAreas: exploredScoreAreas,
                    streak: streak,
                  ),
                  const SizedBox(height: 14),
                ],
                _LibraryStats(
                  read: totalRead,
                  saved: totalSaved,
                  rabbitHoles: rabbitHoles,
                ),
                if (strongestArea != null) ...[
                  const SizedBox(height: 14),
                  _KnowledgeIdentityCard(
                    area: strongestArea,
                    exploredAreas: exploredScoreAreas,
                    started: totalStarted,
                  ),
                ],
                const SizedBox(height: 14),
                _MonthSnapshot(
                  studiedDays: studiedDaysThisMonth,
                  minutes: state.studiedMinutesEstimate(),
                  quizzes: state.totalQuizAttempts,
                ),
                const SizedBox(height: 14),
                _WeeklyBrainCard(
                  topicCount: weeklyTopicIds.length,
                  activeDays: weeklyActiveDays,
                  connections: weeklyConnections,
                  topArea: weeklyTopCategory == null
                      ? null
                      : _displayCategory(weeklyTopCategory),
                  onOpenArea: weeklyTopCategory == null
                      ? null
                      : () => _openCulturalArea(weeklyTopCategory),
                ),
                const SizedBox(height: 30),
                Text(
                  'seu mapa de repertório',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 31,
                      ),
                ),
                const SizedBox(height: 12),
                if (categoryCounts.values.every((count) => count == 0))
                  const _EmptyKnowledgeProfile()
                else ...[
                  CulturalMap(
                    counts: categoryCounts,
                    strengths: _strengthCategories,
                    weakCategories: _weakCategories,
                    onCategoryTap: _openCulturalArea,
                  ),
                  const SizedBox(height: 12),
                  _MapReading(
                    strongest: rankedAreas.isEmpty
                        ? null
                        : _displayCategory(rankedAreas.first.key),
                    frontier: _nextFrontier(categoryCounts),
                  ),
                ],
                const SizedBox(height: 12),
                _ReadingRecord(
                  started: totalStarted,
                  completed: totalRead,
                ),
                const SizedBox(height: 26),
                _AchievementsCard(
                  achievements: _achievements(
                    scoreRounds: _scoreHistory.length,
                    streak: streak,
                    completed: totalRead,
                    started: totalStarted,
                    exploredAreas: exploredScoreAreas,
                    connections: state.personalConnections.length,
                  ),
                ),
                const SizedBox(height: 30),
                _SectionEyebrow(
                  title: 'ritmo de estudo',
                  subtitle: 'uma rotina leve para manter o repertório vivo',
                ),
                const SizedBox(height: 12),
                _StudyGoalCard(
                  studied: state.studiedDaysThisWeek(),
                  goal: state.weeklyGoal,
                  week: state.studyWeek(),
                ),
                const SizedBox(height: 30),
                _SectionEyebrow(
                  title: 'seu espaço',
                  subtitle: 'notas, aparência, leitura e dados',
                ),
                const SizedBox(height: 12),
                _PreferenceGrid(
                  notes: state.notesByTopic.length,
                  remindersEnabled: state.studyRemindersEnabled,
                  reminderHour: state.reminderHour,
                  reminderMinute: state.reminderMinute,
                  dark: state.appAppearance == AppAppearance.dark,
                  readerFontSize: state.readerFontSize,
                  readerTheme: state.readerTheme.name,
                  readerFlow: state.readerFlow.name,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openCulturalArea(String category) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => CulturalAreaScreen(
          category: category,
          isStrong: _strengthCategories.contains(category),
          isWeak: _weakCategories.contains(category),
        ),
      ),
    );
  }

  String? _nextFrontier(Map<String, int> categoryCounts) {
    final entries = categoryCounts.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));
    if (entries.isEmpty) return null;

    final least = entries.first;
    return _displayCategory(least.key);
  }


  String _displayCategory(String value) {
    return switch (value) {
      'ARTE & DESIGN' => 'Arte & design',
      'CIÊNCIA' => 'Ciência',
      'HISTÓRIA' => 'História',
      'PSICOLOGIA' => 'Psicologia',
      'ECONOMIA' => 'Economia',
      'TECNOLOGIA' => 'Tecnologia',
      'MUNDO' => 'Mundo',
      'CULTURA' => 'Cultura',
      _ => value,
    };
  }

  int _currentStreak(Set<String> studyDays) {
    if (studyDays.isEmpty) return 0;
    final days = studyDays
        .map(DateTime.tryParse)
        .whereType<DateTime>()
        .map((date) => DateTime(date.year, date.month, date.day))
        .toSet();
    var cursor = DateTime.now();
    cursor = DateTime(cursor.year, cursor.month, cursor.day);

    if (!days.contains(cursor)) {
      cursor = cursor.subtract(const Duration(days: 1));
      if (!days.contains(cursor)) return 0;
    }

    var streak = 0;
    while (days.contains(cursor)) {
      streak++;
      cursor = cursor.subtract(const Duration(days: 1));
    }
    return streak;
  }

  List<_AchievementData> _achievements({
    required int scoreRounds,
    required int streak,
    required int completed,
    required int started,
    required int exploredAreas,
    required int connections,
  }) {
    return <_AchievementData>[
      _AchievementData(
        icon: Icons.bolt_rounded,
        title: 'primeira faísca',
        subtitle: 'fez o Repertório Score',
        unlocked: scoreRounds >= 1,
      ),
      _AchievementData(
        icon: Icons.timeline_rounded,
        title: 'em evolução',
        subtitle: '3 rodadas de Score',
        unlocked: scoreRounds >= 3,
      ),
      _AchievementData(
        icon: Icons.local_fire_department_outlined,
        title: 'ritmo vivo',
        subtitle: '3 dias seguidos',
        unlocked: streak >= 3,
      ),
      _AchievementData(
        icon: Icons.auto_stories_outlined,
        title: '10 assuntos',
        subtitle: 'leu ou iniciou 10',
        unlocked: completed >= 10 || started >= 10,
      ),
      _AchievementData(
        icon: Icons.hub_outlined,
        title: 'conector',
        subtitle: '3 conexões próprias',
        unlocked: connections >= 3,
      ),
      _AchievementData(
        icon: Icons.public_rounded,
        title: 'radar amplo',
        subtitle: '6 das 8 áreas tocadas',
        unlocked: exploredAreas >= 6,
      ),
    ];
  }
}

class _CulturalPassport extends StatelessWidget {
  const _CulturalPassport({
    required this.score,
    required this.archetype,
    required this.strongestArea,
    required this.exploredAreas,
    required this.streak,
  });

  final int score;
  final String archetype;
  final String? strongestArea;
  final int exploredAreas;
  final int streak;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 14, 15, 14),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.outline),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.badge_outlined, size: 17, color: colors.primary),
              const SizedBox(width: 7),
              Text(
                'PASSAPORTE CULTURAL',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: colors.primary,
                      fontSize: 9,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.0,
                    ),
              ),
              const Spacer(),
              Text(
                '$exploredAreas/8',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: colors.onSurfaceVariant,
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          Text(
            archetype,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: -.5,
                ),
          ),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              final compact = constraints.maxWidth < 380;
              final items = <Widget>[
                _PassportField(label: 'SCORE', value: '$score'),
                _PassportField(
                  label: 'MAIS VIVA',
                  value: strongestArea ?? 'descobrindo',
                ),
                _PassportField(
                  label: 'RITMO',
                  value: streak == 0 ? 'começando' : '$streak dias',
                ),
              ];
              if (compact) {
                return Column(
                  children: items
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: SizedBox(width: double.infinity, child: item),
                        ),
                      )
                      .toList(),
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < items.length; i++) ...[
                    if (i > 0) const SizedBox(width: 8),
                    Expanded(child: items[i]),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PassportField extends StatelessWidget {
  const _PassportField({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      constraints: const BoxConstraints(minHeight: 62),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest.withValues(alpha: .45),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: colors.onSurfaceVariant,
                  fontSize: 8,
                  fontWeight: FontWeight.w900,
                  letterSpacing: .7,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  height: 1.05,
                ),
          ),
        ],
      ),
    );
  }
}

class _WeeklyBrainCard extends StatelessWidget {
  const _WeeklyBrainCard({
    required this.topicCount,
    required this.activeDays,
    required this.connections,
    required this.topArea,
    required this.onOpenArea,
  });

  final int topicCount;
  final int activeDays;
  final int connections;
  final String? topArea;
  final VoidCallback? onOpenArea;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final empty = topicCount == 0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 14),
      decoration: BoxDecoration(
        color: colors.primaryContainer.withValues(alpha: .42),
        border: Border.all(color: colors.primary.withValues(alpha: .42)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SEU CÉREBRO ESTA SEMANA',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: colors.primary,
                  fontSize: 9,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.0,
                ),
          ),
          const SizedBox(height: 9),
          Text(
            empty
                ? 'Sua semana ainda está em branco.'
                : topArea == null
                    ? 'Seu radar passeou por assuntos diferentes.'
                    : 'Seu radar passou mais por $topArea.',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  height: 1.05,
                  letterSpacing: -.4,
                ),
          ),
          const SizedBox(height: 7),
          Text(
            empty
                ? 'Abra um assunto hoje e este retrato começa a mudar.'
                : '$topicCount assuntos tocados · $activeDays dias ativos · $connections conexões criadas',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                  height: 1.4,
                ),
          ),
          if (onOpenArea != null) ...[
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: onOpenArea,
                icon: const Icon(Icons.arrow_outward_rounded, size: 16),
                label: const Text(
                  'ABRIR ÁREA',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 10.5,
                    letterSpacing: .5,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ScorePortrait extends StatelessWidget {
  const _ScorePortrait({
    required this.history,
    required this.strengths,
    required this.weakCategories,
    required this.onRetake,
    required this.onShare,
  });

  final List<_ProfileScoreSnapshot> history;
  final List<String> strengths;
  final List<String> weakCategories;
  final VoidCallback onRetake;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final latest = history.first;
    final previous = history.length > 1 ? history[1] : null;
    final delta = previous == null ? null : latest.score - previous.score;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.primary, width: 1.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'MEU REPERTÓRIO',
                style: textTheme.labelLarge?.copyWith(
                  color: colors.primary,
                  fontSize: 9,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                ),
              ),
              const Spacer(),
              Text(
                '${history.length} rodada${history.length == 1 ? '' : 's'}',
                style: textTheme.labelSmall?.copyWith(
                  color: colors.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${latest.score}',
                style: textTheme.displayLarge?.copyWith(
                  color: colors.primary,
                  fontSize: 72,
                  height: .86,
                  letterSpacing: -4.8,
                  fontWeight: FontWeight.w900,
                ),
              ),
              if (delta != null) ...[
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    '${delta >= 0 ? '+' : ''}$delta',
                    style: textTheme.titleMedium?.copyWith(
                      color: delta >= 0
                          ? colors.primary
                          : colors.onSurfaceVariant,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 7),
          Text(
            latest.archetype,
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
              letterSpacing: -.45,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 88,
            child: CustomPaint(
              painter: _ProfileScoreChartPainter(
                scores: history.reversed.map((item) => item.score).toList(),
                lineColor: colors.primary,
                guideColor: colors.outline,
                fillColor: colors.primaryContainer.withValues(alpha: .38),
              ),
              child: const SizedBox.expand(),
            ),
          ),
          if (strengths.isNotEmpty || weakCategories.isNotEmpty) ...[
            const SizedBox(height: 16),
            Divider(height: 1, color: colors.outline),
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ...strengths.take(3).map(
                  (item) => _ProfileSignalChip(
                    label: 'forte · ${_profileCategoryLabel(item)}',
                    positive: true,
                  ),
                ),
                ...weakCategories.take(2).map(
                  (item) => _ProfileSignalChip(
                    label: 'reforçar · ${_profileCategoryLabel(item)}',
                    positive: false,
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              TextButton.icon(
                onPressed: onShare,
                icon: const Icon(Icons.ios_share_rounded, size: 17),
                label: const Text(
                  'COMPARTILHAR',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: .45,
                    fontSize: 11,
                  ),
                ),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: onRetake,
                icon: const Icon(Icons.refresh_rounded, size: 17),
                label: const Text(
                  'NOVA RODADA',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    letterSpacing: .55,
                    fontSize: 11,
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

class _ProfileSignalChip extends StatelessWidget {
  const _ProfileSignalChip({
    required this.label,
    required this.positive,
  });

  final String label;
  final bool positive;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: positive
            ? colors.primaryContainer
            : colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: colors.outline),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: positive
                  ? colors.onPrimaryContainer
                  : colors.onSurfaceVariant,
              fontWeight: FontWeight.w800,
              fontSize: 10,
            ),
      ),
    );
  }
}

class _ProfileScoreChartPainter extends CustomPainter {
  _ProfileScoreChartPainter({
    required this.scores,
    required this.lineColor,
    required this.guideColor,
    required this.fillColor,
  });

  final List<int> scores;
  final Color lineColor;
  final Color guideColor;
  final Color fillColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (scores.isEmpty) return;
    final baseline = size.height - 8;
    final guide = Paint()
      ..color = guideColor
      ..strokeWidth = 1;
    canvas.drawLine(Offset(0, baseline), Offset(size.width, baseline), guide);

    double yFor(int score) {
      final progress = ((score - 390) / 440).clamp(0.0, 1.0);
      return baseline - progress * (baseline - 6);
    }

    if (scores.length == 1) {
      canvas.drawCircle(
        Offset(size.width / 2, yFor(scores.first)),
        4,
        Paint()..color = lineColor,
      );
      return;
    }

    final step = size.width / (scores.length - 1);
    final path = Path();
    final fill = Path();

    for (var i = 0; i < scores.length; i++) {
      final point = Offset(step * i, yFor(scores[i]));
      if (i == 0) {
        path.moveTo(point.dx, point.dy);
        fill.moveTo(point.dx, baseline);
        fill.lineTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
        fill.lineTo(point.dx, point.dy);
      }
    }

    fill
      ..lineTo(size.width, baseline)
      ..close();

    canvas.drawPath(fill, Paint()..color = fillColor);
    canvas.drawPath(
      path,
      Paint()
        ..color = lineColor
        ..strokeWidth = 3
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..style = PaintingStyle.stroke,
    );

    final dot = Paint()..color = lineColor;
    for (var i = 0; i < scores.length; i++) {
      canvas.drawCircle(Offset(step * i, yFor(scores[i])), 3.2, dot);
    }
  }

  @override
  bool shouldRepaint(covariant _ProfileScoreChartPainter oldDelegate) {
    return oldDelegate.scores != scores ||
        oldDelegate.lineColor != lineColor ||
        oldDelegate.guideColor != guideColor ||
        oldDelegate.fillColor != fillColor;
  }
}

class _AchievementsCard extends StatelessWidget {
  const _AchievementsCard({required this.achievements});

  final List<_AchievementData> achievements;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final unlocked = achievements.where((item) => item.unlocked).length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionEyebrow(
          title: 'conquistas',
          subtitle: '$unlocked de ${achievements.length} desbloqueadas',
        ),
        const SizedBox(height: 12),
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth >= 420
                ? (constraints.maxWidth - 10) / 2
                : constraints.maxWidth;
            return Wrap(
              spacing: 10,
              runSpacing: 10,
              children: achievements
                  .map(
                    (item) => SizedBox(
                      width: width,
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          color: item.unlocked
                              ? colors.primaryContainer
                              : colors.surface,
                          border: Border.all(color: colors.outline),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              item.icon,
                              size: 21,
                              color: item.unlocked
                                  ? colors.primary
                                  : colors.onSurfaceVariant.withValues(alpha: .45),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    item.subtitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: colors.onSurfaceVariant,
                                          fontSize: 10.5,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            if (item.unlocked)
                              Icon(
                                Icons.check_circle_rounded,
                                color: colors.primary,
                                size: 18,
                              ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}

class _AchievementData {
  const _AchievementData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.unlocked,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool unlocked;
}

class _ProfileScoreSnapshot {
  const _ProfileScoreSnapshot({
    required this.score,
    required this.date,
    required this.archetype,
  });

  final int score;
  final DateTime date;
  final String archetype;

  static _ProfileScoreSnapshot? tryParse(String raw) {
    final parts = raw.split('|');
    if (parts.length < 3) return null;
    final score = int.tryParse(parts[0]);
    final date = DateTime.tryParse(parts[1]);
    if (score == null || date == null) return null;
    return _ProfileScoreSnapshot(
      score: score,
      date: date,
      archetype: parts.sublist(2).join('|'),
    );
  }
}

String _profileCategoryLabel(String value) {
  return switch (value) {
    'ARTE & DESIGN' => 'arte & design',
    'CIÊNCIA' => 'ciência',
    'HISTÓRIA' => 'história',
    'PSICOLOGIA' => 'psicologia',
    'ECONOMIA' => 'economia',
    'TECNOLOGIA' => 'tecnologia',
    'MUNDO' => 'mundo',
    'CULTURA' => 'cultura',
    _ => value.toLowerCase(),
  };
}


class _KnowledgeIdentityCard extends StatelessWidget {
  const _KnowledgeIdentityCard({
    required this.area,
    required this.exploredAreas,
    required this.started,
  });

  final String area;
  final int exploredAreas;
  final int started;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest,
        border: Border.all(color: colors.primary),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.auto_awesome_outlined,
              color: colors.onPrimary,
              size: 20,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SEU EIXO AGORA',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: colors.primary,
                        fontSize: 9,
                        letterSpacing: 1,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  area,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$exploredAreas áreas tocadas · $started assuntos iniciados',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MonthSnapshot extends StatelessWidget {
  const _MonthSnapshot({
    required this.studiedDays,
    required this.minutes,
    required this.quizzes,
  });

  final int studiedDays;
  final int minutes;
  final int quizzes;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final stats = [
      (studiedDays, 'dias neste mês'),
      (minutes, 'min estimados'),
      (quizzes, 'quizzes feitos'),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 13, 14, 14),
      decoration: BoxDecoration(
        color: colors.onSurface,
        border: Border.all(color: colors.onSurface),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SEU MÊS ATÉ AGORA',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: colors.surface.withValues(alpha: .65),
                  fontSize: 9,
                  letterSpacing: 1.1,
                ),
          ),
          const SizedBox(height: 12),
          Row(
            children: stats.indexed.map((item) {
              return Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    border: item.$1 == stats.length - 1
                        ? null
                        : Border(
                            right: BorderSide(
                              color: colors.surface.withValues(alpha: .18),
                            ),
                          ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.$2.$1.toString(),
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: colors.surface,
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item.$2.$2,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: colors.surface.withValues(alpha: .62),
                              fontSize: 8,
                            ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _SectionEyebrow extends StatelessWidget {
  const _SectionEyebrow({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 29,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
      ],
    );
  }
}

class _LibraryStats extends StatelessWidget {
  const _LibraryStats({
    required this.read,
    required this.saved,
    required this.rabbitHoles,
  });

  final int read;
  final int saved;
  final int rabbitHoles;

  @override
  Widget build(BuildContext context) {
    final stats = [
      (read.toString(), 'concluídos'),
      (saved.toString(), 'salvos'),
      (rabbitHoles.toString(), 'conexões'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Theme.of(context).colorScheme.onSurface),
      ),
      child: Row(
        children: stats.indexed.map((item) {
          return Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 18,
              ),
              decoration: BoxDecoration(
                border: item.$1 == stats.length - 1
                    ? null
                    : Border(
                        right: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
              ),
              child: Column(
                children: [
                  Text(
                    item.$2.$1,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 36,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.$2.$2,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 9,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _EmptyKnowledgeProfile extends StatelessWidget {
  const _EmptyKnowledgeProfile();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '0 assuntos estudados.',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Assim que você começar a ler, seu mapa de repertório nasce aqui — sem números inventados.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}

class _MapReading extends StatelessWidget {
  const _MapReading({
    required this.strongest,
    required this.frontier,
  });

  final String? strongest;
  final String? frontier;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: _MapReadingCell(
            eyebrow: 'MAIS VIVA',
            value: strongest ?? 'ainda descobrindo',
            icon: Icons.auto_awesome_rounded,
            accent: true,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _MapReadingCell(
            eyebrow: 'PRÓXIMA FRONTEIRA',
            value: frontier ?? 'explore mais',
            icon: Icons.north_east_rounded,
            accent: false,
          ),
        ),
      ],
    );
  }
}

class _MapReadingCell extends StatelessWidget {
  const _MapReadingCell({
    required this.eyebrow,
    required this.value,
    required this.icon,
    required this.accent,
  });

  final String eyebrow;
  final String value;
  final IconData icon;
  final bool accent;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      constraints: const BoxConstraints(minHeight: 86),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: accent
            ? colors.primaryContainer.withValues(alpha: .52)
            : colors.surface,
        border: Border.all(
          color: accent ? colors.primary.withValues(alpha: .52) : colors.outline,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 15,
                color: accent ? colors.primary : colors.onSurfaceVariant,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  eyebrow,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: accent
                            ? colors.primary
                            : colors.onSurfaceVariant,
                        fontSize: 8.5,
                        fontWeight: FontWeight.w900,
                        letterSpacing: .8,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          Text(
            value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  height: 1.05,
                  letterSpacing: -.25,
                ),
          ),
        ],
      ),
    );
  }
}


class _ReadingRecord extends StatelessWidget {
  const _ReadingRecord({
    required this.started,
    required this.completed,
  });

  final int started;
  final int completed;

  @override
  Widget build(BuildContext context) {
    final message = started == 0
        ? 'Sua primeira leitura ainda está esperando por você.'
        : '$started assunto${started == 1 ? '' : 's'} iniciado${started == 1 ? '' : 's'} · $completed concluído${completed == 1 ? '' : 's'}.';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        border: Border.all(color: Theme.of(context).colorScheme.onSurface),
      ),
      child: Row(
        children: [
          Icon(
            Icons.auto_stories_outlined,
            color: Theme.of(context).colorScheme.surface,
            size: 28,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  started == 0 ? 'seu acervo está zerado' : 'seu histórico',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 16,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PreferenceGrid extends StatelessWidget {
  const _PreferenceGrid({
    required this.notes,
    required this.remindersEnabled,
    required this.reminderHour,
    required this.reminderMinute,
    required this.dark,
    required this.readerFontSize,
    required this.readerTheme,
    required this.readerFlow,
  });

  final int notes;
  final bool remindersEnabled;
  final int reminderHour;
  final int reminderMinute;
  final bool dark;
  final double readerFontSize;
  final String readerTheme;
  final String readerFlow;

  @override
  Widget build(BuildContext context) {
    final reminderTime =
        '${reminderHour.toString().padLeft(2, '0')}:${reminderMinute.toString().padLeft(2, '0')}';

    final items = <_PreferenceShortcutData>[
      _PreferenceShortcutData(
        title: 'notas',
        subtitle: notes == 0 ? 'nenhuma ainda' : '$notes salvas',
        icon: Icons.sticky_note_2_outlined,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (_) => const NotesScreen()),
        ),
      ),
      _PreferenceShortcutData(
        title: 'lembretes',
        subtitle: remindersEnabled ? reminderTime : 'desativados',
        icon: remindersEnabled
            ? Icons.notifications_active_outlined
            : Icons.notifications_none,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const NotificationSettingsScreen(),
          ),
        ),
      ),
      _PreferenceShortcutData(
        title: 'aparência',
        subtitle: dark ? 'escuro' : 'claro',
        icon: dark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (_) => const AppearanceScreen()),
        ),
      ),
      _PreferenceShortcutData(
        title: 'acessibilidade',
        subtitle: 'toque e contraste',
        icon: Icons.accessibility_new_outlined,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (_) => const AccessibilityScreen()),
        ),
      ),
      _PreferenceShortcutData(
        title: 'backup',
        subtitle: 'dados locais',
        icon: Icons.shield_outlined,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (_) => const BackupScreen()),
        ),
      ),
      _PreferenceShortcutData(
        title: 'leitor',
        subtitle:
            '${readerFontSize.round()} pt · ${_readerLabel(readerTheme, readerFlow)}',
        icon: Icons.text_fields_rounded,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 350 ? 2 : 1;
        const gap = 10.0;
        final width =
            (constraints.maxWidth - gap * (columns - 1)) / columns;

        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: items
              .map(
                (item) => SizedBox(
                  width: width,
                  child: _PreferenceShortcut(data: item),
                ),
              )
              .toList(),
        );
      },
    );
  }

  String _readerLabel(String theme, String flow) {
    final themeLabel = switch (theme) {
      'paper' => 'papel',
      'sepia' => 'sépia',
      'dark' => 'escuro',
      _ => theme,
    };
    final flowLabel = flow == 'paged' ? 'páginas' : 'contínuo';
    return '$themeLabel · $flowLabel';
  }
}

class _PreferenceShortcutData {
  const _PreferenceShortcutData({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;
}

class _PreferenceShortcut extends StatelessWidget {
  const _PreferenceShortcut({required this.data});

  final _PreferenceShortcutData data;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final content = Container(
      constraints: const BoxConstraints(minHeight: 92),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(data.icon, size: 20, color: colors.primary),
              const Spacer(),
              if (data.onTap != null)
                Icon(
                  Icons.arrow_outward_rounded,
                  size: 16,
                  color: colors.onSurfaceVariant,
                ),
            ],
          ),
          const SizedBox(height: 13),
          Text(
            data.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 2),
          Text(
            data.subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );

    if (data.onTap == null) return content;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: data.onTap,
        child: content,
      ),
    );
  }
}

class _ReaderPreferences extends StatelessWidget {
  const _ReaderPreferences({
    required this.fontSize,
    required this.theme,
    required this.flow,
  });

  final double fontSize;
  final String theme;
  final String flow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Row(
        children: [
          const Icon(Icons.tune, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Leitor: fonte ${fontSize.round()} · $theme · $flow',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}


class _NotificationPreferences extends StatelessWidget {
  const _NotificationPreferences({
    required this.enabled,
    required this.hour,
    required this.minute,
  });

  final bool enabled;
  final int hour;
  final int minute;

  @override
  Widget build(BuildContext context) {
    final formatted =
        '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const NotificationSettingsScreen(),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: Row(
            children: [
              Icon(
                enabled
                    ? Icons.notifications_active_outlined
                    : Icons.notifications_none,
                color: enabled ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'lembretes de estudo',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 15,
                          ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      enabled ? 'ativo às $formatted' : 'desativado',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}


class _StudyGoalCard extends StatelessWidget {
  const _StudyGoalCard({
    required this.studied,
    required this.goal,
    required this.week,
  });

  final int studied;
  final int goal;
  final List<bool> week;

  @override
  Widget build(BuildContext context) {
    const labels = ['S', 'T', 'Q', 'Q', 'S', 'S', 'D'];
    final reached = studied >= goal;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: reached ? Theme.of(context).colorScheme.surfaceContainerHighest : Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: reached ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.outline,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.calendar_month_outlined, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'meta semanal',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 15,
                      ),
                ),
              ),
              TextButton(
                onPressed: () => _pickGoal(context),
                child: Text('$goal dias'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: week.indexed.map((item) {
              final active = item.$2;
              return Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: active ? Theme.of(context).colorScheme.primary : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: active ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      child: active
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 16,
                            )
                          : Text(
                              labels[item.$1],
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontSize: 9),
                            ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          Text(
            reached
                ? 'Meta concluída — ritmo mantido.'
                : '$studied de $goal dias estudados nesta semana.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: reached ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickGoal(BuildContext context) async {
    final selected = await showModalBottomSheet<int>(
      context: context,
      useSafeArea: true,
      builder: (sheetContext) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'quantos dias por semana?',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'É uma referência leve, não uma sequência obrigatória.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 18),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(7, (index) {
                  final value = index + 1;
                  return ChoiceChip(
                    label: Text('$value'),
                    selected: value == goal,
                    onSelected: (_) =>
                        Navigator.of(sheetContext).pop(value),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );

    if (selected == null || !context.mounted) {
      return;
    }
    await AppStateScope.read(context).updateWeeklyGoal(selected);
  }
}

class _BackupPreferences extends StatelessWidget {
  const _BackupPreferences();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const BackupScreen(),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: const Row(
            children: [
              Icon(Icons.shield_outlined, size: 24),
              SizedBox(width: 12),
              Expanded(
                child: Text('backup e dados locais'),
              ),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}


class _NotesPreferences extends StatelessWidget {
  const _NotesPreferences({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const NotesScreen(),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: Row(
            children: [
              const Icon(Icons.sticky_note_2_outlined, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  count == 0
                      ? 'minhas notas'
                      : 'minhas notas · $count',
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}


class _AccessibilityPreferences extends StatelessWidget {
  const _AccessibilityPreferences();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const AccessibilityScreen(),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: const Row(
            children: [
              Icon(Icons.accessibility_new_outlined, size: 24),
              SizedBox(width: 12),
              Expanded(child: Text('acessibilidade')),
              Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}


class _AppearancePreferences extends StatelessWidget {
  const _AppearancePreferences({required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Material(
      color: colors.surface,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => const AppearanceScreen(),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: colors.outline),
          ),
          child: Row(
            children: [
              Icon(
                dark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  dark ? 'aparência · escuro' : 'aparência · claro',
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
