import 'package:flutter/material.dart';

import '../features/onboarding/presentation/onboarding_screen.dart';
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

        return AppStateScope(
          state: state,
          child: AnimatedBuilder(
            animation: state,
            builder: (context, _) {
              return MaterialApp(
                title: 'Repertório',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.light,
                home: state.onboardingComplete
                    ? const AppShell()
                    : const OnboardingScreen(),
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
