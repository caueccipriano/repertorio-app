import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/updates/app_update.dart';
import '../features/explore/presentation/explore_screen.dart';
import '../features/profile/presentation/profile_screen.dart';
import '../features/saved/presentation/saved_screen.dart';
import '../features/study/presentation/study_hub_screen.dart';
import '../features/today/presentation/today_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;
  bool _updateAvailable = false;
  bool _checkingUpdate = false;
  Timer? _initialUpdateTimer;

  static const _screens = [
    TodayScreen(),
    ExploreScreen(),
    StudyHubScreen(),
    SavedScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _initialUpdateTimer = Timer(
      const Duration(seconds: 4),
      _checkForUpdate,
    );
  }

  @override
  void dispose() {
    _initialUpdateTimer?.cancel();
    super.dispose();
  }

  Future<void> _checkForUpdate() async {
    if (_checkingUpdate) return;
    _checkingUpdate = true;
    final available = await checkAppUpdate();
    if (!mounted) return;
    setState(() {
      _checkingUpdate = false;
      _updateAvailable = available;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: Column(
        children: [
          if (_updateAvailable)
            Material(
              color: colors.surfaceContainerHighest,
              child: SafeArea(
                bottom: false,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(14, 8, 8, 8),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: colors.outline),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.system_update_alt,
                        size: 19,
                        color: colors.primary,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'nova versão disponível',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: colors.onSurface,
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                      ),
                      const TextButton(
                        onPressed: applyAppUpdate,
                        child: Text('atualizar'),
                      ),
                      IconButton(
                        tooltip: 'Depois',
                        visualDensity: VisualDensity.compact,
                        onPressed: () =>
                            setState(() => _updateAvailable = false),
                        icon: const Icon(Icons.close, size: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          Expanded(
            child: IndexedStack(
              index: _index,
              children: _screens,
            ),
          ),
        ],
      ),
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: colors.outline),
          ),
        ),
        child: SafeArea(
          top: false,
          child: NavigationBar(
            selectedIndex: _index,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            onDestinationSelected: (value) {
              if (value == _index) return;
              HapticFeedback.selectionClick();
              setState(() => _index = value);
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.auto_stories_outlined),
                selectedIcon: Icon(Icons.auto_stories),
                label: 'Hoje',
              ),
              NavigationDestination(
                icon: Icon(Icons.explore_outlined),
                selectedIcon: Icon(Icons.explore),
                label: 'Explorar',
              ),
              NavigationDestination(
                icon: Icon(Icons.school_outlined),
                selectedIcon: Icon(Icons.school),
                label: 'Estudar',
              ),
              NavigationDestination(
                icon: Icon(Icons.collections_bookmark_outlined),
                selectedIcon: Icon(Icons.collections_bookmark),
                label: 'Biblioteca',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: 'Eu',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
