import 'package:flutter/material.dart';

import '../../../app/state/app_state.dart';
import '../../../app/state/app_state_scope.dart';
import '../../../app/theme/app_colors.dart';

Future<void> showReaderControls(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    backgroundColor: AppColors.paperWhite,
    builder: (_) => const ReaderControlsSheet(),
  );
}

class ReaderControlsSheet extends StatelessWidget {
  const ReaderControlsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 26),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'leitura',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Spacer(),
              Text(
                'Aa',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: AppColors.blue,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          _Label('TAMANHO'),
          Row(
            children: [
              IconButton(
                tooltip: 'Diminuir fonte',
                onPressed: state.readerFontSize <= 14
                    ? null
                    : () => state.updateReaderSettings(
                          fontSize: state.readerFontSize - 1,
                        ),
                icon: const Icon(Icons.text_decrease),
              ),
              Expanded(
                child: Slider(
                  value: state.readerFontSize,
                  min: 14,
                  max: 24,
                  divisions: 10,
                  label: state.readerFontSize.round().toString(),
                  onChanged: (value) => state.updateReaderSettings(
                    fontSize: value,
                  ),
                ),
              ),
              IconButton(
                tooltip: 'Aumentar fonte',
                onPressed: state.readerFontSize >= 24
                    ? null
                    : () => state.updateReaderSettings(
                          fontSize: state.readerFontSize + 1,
                        ),
                icon: const Icon(Icons.text_increase),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _Label('FONTE'),
          const SizedBox(height: 8),
          SegmentedButton<ReaderFontFamily>(
            segments: const [
              ButtonSegment(
                value: ReaderFontFamily.editorial,
                label: Text('Editorial'),
                icon: Icon(Icons.auto_stories_outlined),
              ),
              ButtonSegment(
                value: ReaderFontFamily.sans,
                label: Text('Sans'),
                icon: Icon(Icons.notes_outlined),
              ),
            ],
            selected: {state.readerFont},
            onSelectionChanged: (value) => state.updateReaderSettings(
              font: value.first,
            ),
          ),
          const SizedBox(height: 18),
          _Label('TEMA'),
          const SizedBox(height: 8),
          SegmentedButton<ReaderThemeMode>(
            segments: const [
              ButtonSegment(
                value: ReaderThemeMode.paper,
                label: Text('Papel'),
              ),
              ButtonSegment(
                value: ReaderThemeMode.sepia,
                label: Text('Sépia'),
              ),
              ButtonSegment(
                value: ReaderThemeMode.dark,
                label: Text('Escuro'),
              ),
            ],
            selected: {state.readerTheme},
            onSelectionChanged: (value) => state.updateReaderSettings(
              theme: value.first,
            ),
          ),
          const SizedBox(height: 18),
          _Label('FLUXO'),
          const SizedBox(height: 8),
          SegmentedButton<ReaderFlow>(
            segments: const [
              ButtonSegment(
                value: ReaderFlow.continuous,
                label: Text('Rolagem'),
                icon: Icon(Icons.swap_vert),
              ),
              ButtonSegment(
                value: ReaderFlow.paged,
                label: Text('Páginas'),
                icon: Icon(Icons.menu_book_outlined),
              ),
            ],
            selected: {state.readerFlow},
            onSelectionChanged: (value) => state.updateReaderSettings(
              flow: value.first,
            ),
          ),
          const SizedBox(height: 18),
          _Label('ESPAÇAMENTO'),
          Slider(
            value: state.readerLineHeight,
            min: 1.3,
            max: 2,
            divisions: 7,
            onChanged: (value) => state.updateReaderSettings(
              lineHeight: value,
            ),
          ),
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.muted,
            fontSize: 10,
            letterSpacing: 1.2,
          ),
    );
  }
}
