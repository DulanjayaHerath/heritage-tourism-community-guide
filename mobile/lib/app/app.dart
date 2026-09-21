import 'package:flutter/material.dart';

import 'theme/app_theme.dart';

import '../features/onboarding/welcome_screen.dart';

class HeritageTourismApp extends StatelessWidget {
  const HeritageTourismApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heritage Tourism & Community Guide',

      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      home: const WelcomeScreen(),
    );
  }
}