import 'package:flutter/material.dart';

import 'theme/app_theme.dart';

class HeritageTourismApp extends StatelessWidget {
  const HeritageTourismApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heritage Tourism & Community Guide',

      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Heritage Tourism'),
        ),

        body: const Center(
          child: Text(
            'Discover the Hidden Heritage of Sri Lanka',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}