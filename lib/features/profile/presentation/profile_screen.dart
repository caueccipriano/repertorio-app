import 'package:flutter/material.dart';

import '../../../app/state/app_state.dart';
import '../../../app/state/app_state_scope.dart';
import '../../../core/widgets/editorial_frame.dart';
import '../../../core/widgets/paper_texture.dart';
import '../../today/data/demo_topics.dart';
import 'accessibility_screen.dart';
import 'appearance_screen.dart';
import 'backup_screen.dart';
import 'notification_settings_screen.dart';
import 'notes_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final exploredIds = {
      ...state.historyTopicIds,
      ...state.completedTopicIds,
    };
    final categoryCounts = <String, int>{};

    for (final id in exploredIds) {
      final topic = topicById(id);
      if (topic == null) {
        continue;
      }
      for (final tag in topic.tags) {
        categoryCounts.update(
          tag,
          (value) => value + 1,
          ifAbsent: () => 1,
        );
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
    final rankedAreas = categoryCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final strongestArea =
        rankedAreas.isEmpty ? null : _titleCase(rankedAreas.first.key);

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
                const SizedBox(height: 26),
                _LibraryStats(
                  read: totalRead,
                  saved: totalSaved,
                  rabbitHoles: rabbitHoles,
                ),
                if (strongestArea != null) ...[
                  const SizedBox(height: 14),
                  _KnowledgeIdentityCard(
                    area: strongestArea,
                    exploredAreas: categoryCounts.length,
                    started: totalStarted,
                  ),
                ],
                const SizedBox(height: 30),
                Text(
                  'seu mapa de assuntos',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 31,
                      ),
                ),
                const SizedBox(height: 16),
                if (categoryCounts.isEmpty)
                  const _EmptyKnowledgeProfile()
                else
                  ..._categoryRows(context, categoryCounts),
                const SizedBox(height: 12),
                _ReadingRecord(
                  started: totalStarted,
                  completed: totalRead,
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
                _NotesPreferences(count: state.notesByTopic.length),
                const SizedBox(height: 14),
                const _BackupPreferences(),
                const SizedBox(height: 14),
                _NotificationPreferences(
                  enabled: state.studyRemindersEnabled,
                  hour: state.reminderHour,
                  minute: state.reminderMinute,
                ),
                const SizedBox(height: 14),
                _AppearancePreferences(
                  dark: state.appAppearance == AppAppearance.dark,
                ),
                const SizedBox(height: 14),
                const _AccessibilityPreferences(),
                const SizedBox(height: 14),
                _ReaderPreferences(
                  fontSize: state.readerFontSize,
                  theme: state.readerTheme.name,
                  flow: state.readerFlow.name,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _categoryRows(
    BuildContext context,
    Map<String, int> categoryCounts,
  ) {
    final maxCount = categoryCounts.values.fold<int>(
      1,
      (max, value) => value > max ? value : max,
    );
    final sorted = categoryCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sorted
        .map(
          (entry) => _ProgressRow(
            label: _titleCase(entry.key),
            value: entry.value / maxCount,
            count: entry.value,
          ),
        )
        .toList();
  }

  String _titleCase(String value) {
    if (value.isEmpty) {
      return value;
    }
    return '${value[0].toUpperCase()}${value.substring(1)}';
  }
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

class _ProgressRow extends StatelessWidget {
  const _ProgressRow({
    required this.label,
    required this.value,
    required this.count,
  });

  final String label;
  final double value;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 16,
                    ),
              ),
              const Spacer(),
              Text(
                count.toString(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 10,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: value,
            minHeight: 5,
            backgroundColor: Theme.of(context).colorScheme.outline,
            color: Theme.of(context).colorScheme.primary,
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
                ? 'Meta concluída — sem streak, sem culpa.'
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
