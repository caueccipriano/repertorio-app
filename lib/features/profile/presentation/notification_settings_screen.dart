import 'package:flutter/material.dart';

import '../../../app/state/app_state_scope.dart';
import '../../../app/theme/app_colors.dart';
import '../../../core/notifications/study_notifications.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool _requestingPermission = false;

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final time = TimeOfDay(
      hour: state.reminderHour,
      minute: state.reminderMinute,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('lembretes')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 16, 18, 36),
          children: [
            Text(
              'estudar sem virar obrigação.',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Você escolhe quando o Repertório pode te cutucar. Nada de streak agressivo.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.muted,
                  ),
            ),
            const SizedBox(height: 28),
            _SettingCard(
              child: Column(
                children: [
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Lembrete diário'),
                    subtitle: Text(
                      state.studyRemindersEnabled
                          ? 'Ativo às ${time.format(context)}'
                          : 'Desativado',
                    ),
                    value: state.studyRemindersEnabled,
                    onChanged: (value) => _toggleReminder(value),
                  ),
                  const Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    enabled: state.studyRemindersEnabled,
                    leading: const Icon(Icons.schedule),
                    title: const Text('Horário'),
                    trailing: Text(
                      time.format(context),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.blue,
                            fontSize: 15,
                          ),
                    ),
                    onTap: state.studyRemindersEnabled
                        ? () => _pickTime(time)
                        : null,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            _SettingCard(
              child: Column(
                children: [
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Revisões pendentes'),
                    subtitle: const Text(
                      'Prioriza assuntos que estão na hora de revisar.',
                    ),
                    value: state.reviewRemindersEnabled,
                    onChanged: (value) =>
                        state.updateReminderSettings(reviewEnabled: value),
                  ),
                  const Divider(),
                  SwitchListTile.adaptive(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Edição do dia'),
                    subtitle: const Text(
                      'Pode lembrar que há uma nova seleção para explorar.',
                    ),
                    value: state.dailyEditionRemindersEnabled,
                    onChanged: (value) => state.updateReminderSettings(
                      dailyEditionEnabled: value,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            _SettingCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Icon(
                        studyNotificationPermissionGranted
                            ? Icons.notifications_active_outlined
                            : Icons.notifications_off_outlined,
                        color: studyNotificationPermissionGranted
                            ? AppColors.blue
                            : AppColors.muted,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          studyNotificationPermissionGranted
                              ? 'Notificações permitidas neste dispositivo'
                              : studyNotificationsSupported
                                  ? 'O navegador ainda não deu permissão'
                                  : 'Notificações não disponíveis aqui',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontSize: 14,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    onPressed: _requestingPermission ||
                            !studyNotificationsSupported
                        ? null
                        : _requestPermission,
                    icon: const Icon(Icons.notifications_none),
                    label: Text(
                      studyNotificationPermissionGranted
                          ? 'verificar novamente'
                          : 'permitir notificações',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton.icon(
                    onPressed: studyNotificationPermissionGranted
                        ? () {
                            showStudyNotification(
                              title: 'repertório*',
                              body:
                                  'Teste concluído. Seu lembrete de estudo está funcionando.',
                            );
                          }
                        : null,
                    icon: const Icon(Icons.science_outlined),
                    label: const Text('enviar notificação de teste'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Nesta versão local-first, lembretes funcionam enquanto o PWA está ativo. Push com o app totalmente fechado entra quando conectarmos um serviço de envio.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.muted,
                    fontSize: 12,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _toggleReminder(bool value) async {
    if (!value) {
      await AppStateScope.read(context).updateReminderSettings(
        enabled: false,
      );
      return;
    }

    setState(() => _requestingPermission = true);
    final granted = await requestStudyNotificationPermission();
    if (!mounted) {
      return;
    }
    setState(() => _requestingPermission = false);

    await AppStateScope.read(context).updateReminderSettings(
      enabled: granted,
    );

    if (!granted && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Precisamos da permissão do navegador para ativar lembretes.',
          ),
        ),
      );
    }
  }

  Future<void> _requestPermission() async {
    setState(() => _requestingPermission = true);
    final granted = await requestStudyNotificationPermission();
    if (!mounted) {
      return;
    }
    setState(() => _requestingPermission = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          granted
              ? 'Notificações permitidas.'
              : 'Permissão não concedida.',
        ),
      ),
    );
  }

  Future<void> _pickTime(TimeOfDay initial) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: initial,
    );
    if (selected == null || !mounted) {
      return;
    }

    await AppStateScope.read(context).updateReminderSettings(
      hour: selected.hour,
      minute: selected.minute,
    );
  }
}

class _SettingCard extends StatelessWidget {
  const _SettingCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.paperWhite,
        border: Border.all(color: AppColors.ink),
      ),
      child: child,
    );
  }
}
