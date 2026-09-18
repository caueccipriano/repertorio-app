import 'package:flutter/material.dart';

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
    Future<void>.delayed(
      const Duration(seconds: 4),
      _checkForUpdate,
    );
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
    return Scaffold(
      body: Column(
        children: [
          if (_updateAvailable)
            Material(
              color: const Color(0xFFDCE4F8),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 8, 10, 8),
                  child: Row(
                    children: [
                      const Icon(Icons.system_update_alt, size: 20),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'nova versão disponível',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: applyAppUpdate,
                        child: const Text('atualizar'),
                      ),
                      IconButton(
                        tooltip: 'Depois',
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
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Início',
          ),
          NavigationDestination(
            icon: Icon(Icons.grid_view_outlined),
            selectedIcon: Icon(Icons.grid_view_rounded),
            label: 'Catálogo',
          ),
          NavigationDestination(
            icon: Icon(Icons.psychology_alt_outlined),
            selectedIcon: Icon(Icons.psychology_alt),
            label: 'Estudar',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_border),
            selectedIcon: Icon(Icons.bookmark),
            label: 'Salvos',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Eu',
          ),
        ],
      ),
    );
  }
}
