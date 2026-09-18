import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app/state/app_state_scope.dart';
import '../../../app/theme/app_colors.dart';

class BackupScreen extends StatelessWidget {
  const BackupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('backup')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 36),
          children: [
            Text(
              'seu repertório é seu.',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Sem login, seus dados ficam neste aparelho. O backup permite levar progresso, salvos, notas, revisões e preferências para outro navegador ou dispositivo.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 26),
            _BackupCard(
              icon: Icons.content_copy_outlined,
              title: 'copiar backup',
              body:
                  'Gera um texto JSON com todo o seu estado local. Guarde em Notas, Drive ou onde preferir.',
              actionLabel: 'copiar agora',
              onTap: () async {
                final backup = state.exportBackup();
                await Clipboard.setData(ClipboardData(text: backup));
                if (!context.mounted) {
                  return;
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Backup copiado. Guarde esse texto em um lugar seguro.',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 14),
            _BackupCard(
              icon: Icons.restore_outlined,
              title: 'restaurar backup',
              body:
                  'Cole um backup do Repertório. Os dados atuais serão substituídos pelo conteúdo importado.',
              actionLabel: 'colar e restaurar',
              onTap: () => _showRestoreDialog(context),
            ),
            const SizedBox(height: 22),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                border: Border.all(color: Theme.of(context).colorScheme.primary),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.offline_bolt_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Os textos e seu progresso são local-first. Imagens externas, vídeos e áudios ainda podem precisar de internet.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showRestoreDialog(BuildContext context) async {
    final controller = TextEditingController();

    final raw = await showDialog<String>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('restaurar backup'),
          content: SizedBox(
            width: 520,
            child: TextField(
              controller: controller,
              minLines: 7,
              maxLines: 14,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Cole aqui o backup do Repertório…',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('cancelar'),
            ),
            FilledButton(
              onPressed: () =>
                  Navigator.of(dialogContext).pop(controller.text),
              child: const Text('restaurar'),
            ),
          ],
        );
      },
    );

    controller.dispose();

    if (raw == null || raw.trim().isEmpty || !context.mounted) {
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('substituir dados atuais?'),
        content: const Text(
          'O backup importado vai substituir seu progresso, salvos, notas e preferências atuais neste aparelho.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('sim, restaurar'),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) {
      return;
    }

    final success = await AppStateScope.read(context).importBackup(raw);
    if (!context.mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success
              ? 'Backup restaurado com sucesso.'
              : 'Esse arquivo não parece ser um backup válido do Repertório.',
        ),
      ),
    );
  }
}

class _BackupCard extends StatelessWidget {
  const _BackupCard({
    required this.icon,
    required this.title,
    required this.body,
    required this.actionLabel,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String body;
  final String actionLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Theme.of(context).colorScheme.onSurface),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 30),
          const SizedBox(height: 18),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: onTap,
              child: Text(actionLabel),
            ),
          ),
        ],
      ),
    );
  }
}
