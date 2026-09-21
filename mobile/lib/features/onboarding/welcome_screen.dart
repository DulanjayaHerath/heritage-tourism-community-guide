import 'package:flutter/material.dart';

import '../../app/theme/app_theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

          // Background heritage image
          Image.asset(
            'assets/images/welcome_heritage.jpeg',
            fit: BoxFit.cover,
          ),

          // Dark gradient over the image
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color(0x66000000),
                  Color(0xE6000000),
                ],
                stops: [0.2, 0.5, 1.0],
              ),
            ),
          ),

          // Welcome content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 32,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  const Spacer(),

                  const Text(
                    'DISCOVER SRI LANKA',
                    style: TextStyle(
                      color: AppTheme.accentOrange,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "Hidden Heritage\nAwaits You",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      height: 1.15,
                    ),
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    'Explore remarkable historical places, '
                    'discover local traditions, and connect '
                    'with authentic community experiences.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 36),

                  SizedBox(
                    width: double.infinity,
                    height: 56,

                    child: ElevatedButton(
                      onPressed: () {
                        // Navigation will be added next.
                      },

                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}