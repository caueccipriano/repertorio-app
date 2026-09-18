import 'dart:async';

import 'package:flutter/material.dart';

import '../core/notifications/study_notifications.dart';
import 'app_shell.dart';
import 'state/app_state.dart';
import 'state/app_state_scope.dart';
import 'theme/app_colors.dart';
import 'theme/app_theme.dart';

class RepertorioApp extends StatefulWidget {
  const RepertorioApp({super.key});

  @override
  State<RepertorioApp> createState() => _RepertorioAppState();
}

class _RepertorioAppState extends State<RepertorioApp> {
  late final Future<AppState> _stateFuture = AppState.load();
  Timer? _reminderTimer;
  AppState? _reminderState;

  @override
  void dispose() {
    _reminderTimer?.cancel();
    super.dispose();
  }

  void _ensureReminderLoop(AppState state) {
    if (identical(_reminderState, state)) {
      return;
    }

    _reminderState = state;
    _reminderTimer?.cancel();

    Future<void> check() async {
      if (!state.shouldSendStudyReminder()) {
        return;
      }
      if (!studyNotificationPermissionGranted) {
        return;
      }

      final dueReviews = state.dueReviewTopicIds().length;
      final body = dueReviews > 0 && state.reviewRemindersEnabled
          ? 'Você tem $dueReviews revisão${dueReviews == 1 ? '' : 'ões'} esperando. Cinco minutos já contam.'
          : 'Sua edição de hoje está esperando. Cinco minutos para aprender algo novo?';

      showStudyNotification(
        title: 'repertório*',
        body: body,
      );
      await state.markStudyReminderShown();
    }

    check();
    _reminderTimer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => check(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AppState>(
      future: _stateFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            home: const _BootstrapSplash(),
          );
        }

        final state = snapshot.requireData;
        _ensureReminderLoop(state);

        return AppStateScope(
          state: state,
          child: AnimatedBuilder(
            animation: state,
            builder: (context, _) {
              return MaterialApp(
                title: 'Repertório',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightWith(
                  highContrast: state.highContrast,
                  reduceMotion: state.reduceMotion,
                  largeTapTargets: state.largeTapTargets,
                ),
                darkTheme: AppTheme.darkWith(
                  highContrast: state.highContrast,
                  reduceMotion: state.reduceMotion,
                  largeTapTargets: state.largeTapTargets,
                ),
                themeMode: state.appAppearance == AppAppearance.dark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                // Do not gate app startup behind onboarding. This avoids the
                // iOS standalone-PWA touch deadlock that could trap users on
                // the welcome screen. Onboarding can remain an optional flow.
                home: const AppShell(),
              );
            },
          ),
        );
      },
    );
  }
}

class _BootstrapSplash extends StatelessWidget {
  const _BootstrapSplash();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.paper,
      body: SafeArea(
        child: Center(
          child: Text(
            'repertório*',
            style: TextStyle(
              color: AppColors.blue,
              fontSize: 24,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
            ),
          ),
        ),
      ),
    );
  }
}
