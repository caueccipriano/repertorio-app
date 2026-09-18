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

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: .82,
      maxChildSize: .94,
      minChildSize: .55,
      builder: (context, controller) {
        return ListView(
          controller: controller,
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 34),
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
            const _Label('PROFUNDIDADE'),
            const SizedBox(height: 8),
            SegmentedButton<ContentDepth>(
              segments: const [
                ButtonSegment(
                  value: ContentDepth.quick,
                  label: Text('30 s'),
                ),
                ButtonSegment(
                  value: ContentDepth.standard,
                  label: Text('5 min'),
                ),
                ButtonSegment(
                  value: ContentDepth.deep,
                  label: Text('15 min'),
                ),
                ButtonSegment(
                  value: ContentDepth.immersion,
                  label: Text('fundo'),
                ),
              ],
              selected: {state.readerDepth},
              onSelectionChanged: (value) => state.updateReaderSettings(
                depth: value.first,
              ),
            ),
            const SizedBox(height: 20),
            const _Label('TAMANHO'),
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
            const _Label('FONTE'),
            const SizedBox(height: 8),
            SegmentedButton<ReaderFontFamily>(
              segments: const [
                ButtonSegment(
                  value: ReaderFontFamily.editorial,
                  label: Text('Editorial'),
                ),
                ButtonSegment(
                  value: ReaderFontFamily.sans,
                  label: Text('Sans'),
                ),
                ButtonSegment(
                  value: ReaderFontFamily.readable,
                  label: Text('Legível'),
                ),
              ],
              selected: {state.readerFont},
              onSelectionChanged: (value) => state.updateReaderSettings(
                font: value.first,
              ),
            ),
            const SizedBox(height: 18),
            const _Label('TEMA'),
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
            const _Label('FLUXO'),
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
            const _Label('ALINHAMENTO'),
            const SizedBox(height: 8),
            SegmentedButton<ReaderTextAlignment>(
              segments: const [
                ButtonSegment(
                  value: ReaderTextAlignment.left,
                  label: Text('Esquerda'),
                  icon: Icon(Icons.format_align_left),
                ),
                ButtonSegment(
                  value: ReaderTextAlignment.justify,
                  label: Text('Justificado'),
                  icon: Icon(Icons.format_align_justify),
                ),
              ],
              selected: {state.readerAlignment},
              onSelectionChanged: (value) => state.updateReaderSettings(
                alignment: value.first,
              ),
            ),
            const SizedBox(height: 18),
            const _Label('ESPAÇAMENTO'),
            Slider(
              value: state.readerLineHeight,
              min: 1.3,
              max: 2,
              divisions: 7,
              onChanged: (value) => state.updateReaderSettings(
                lineHeight: value,
              ),
            ),
            const _Label('LARGURA DA COLUNA'),
            Slider(
              value: state.readerColumnWidth,
              min: 520,
              max: 860,
              divisions: 17,
              label: state.readerColumnWidth.round().toString(),
              onChanged: (value) => state.updateReaderSettings(
                columnWidth: value,
              ),
            ),
            const _Label('MARGENS'),
            Slider(
              value: state.readerMargin,
              min: 12,
              max: 40,
              divisions: 14,
              onChanged: (value) => state.updateReaderSettings(
                margin: value,
              ),
            ),
            const _Label('VELOCIDADE DO ÁUDIO'),
            Slider(
              value: state.voiceRate,
              min: .7,
              max: 1.5,
              divisions: 8,
              label: '${state.voiceRate.toStringAsFixed(1)}×',
              onChanged: (value) => state.updateReaderSettings(
                newVoiceRate: value,
              ),
            ),
            const SizedBox(height: 8),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              title: const Text('Modo foco'),
              subtitle: const Text(
                'Esconde ações extras e deixa quase só texto + progresso.',
              ),
              value: state.readerFocusMode,
              onChanged: (value) => state.updateReaderSettings(
                focusMode: value,
              ),
            ),
          ],
        );
      },
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
