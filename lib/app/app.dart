import 'package:flutter/material.dart';

import 'app_shell.dart';
import 'theme/app_theme.dart';

class RepertorioApp extends StatelessWidget {
  const RepertorioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Repertório',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const AppShell(),
    );
  }
}
