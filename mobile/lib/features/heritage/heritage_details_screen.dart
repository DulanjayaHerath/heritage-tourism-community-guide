import 'package:flutter/material.dart';

import '../../app/theme/app_theme.dart';
import '../../models/heritage_site.dart';

class HeritageDetailsScreen extends StatelessWidget {
  final HeritageSite site;

  const HeritageDetailsScreen({
    super.key,
    required this.site,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,

            backgroundColor: AppTheme.primaryGreen,

            foregroundColor: Colors.white,

            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                site.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    site.category.toUpperCase(),
                    style: const TextStyle(
                      color: AppTheme.accentOrange,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    site.name,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: AppTheme.primaryGreen,
                      ),

                      const SizedBox(width: 6),

                      Text(
                        site.location,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  const Divider(),

                  const SizedBox(height: 24),

                  const Text(
                    'About this Heritage Site',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    site.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.7,
                      color: AppTheme.textDark,
                    ),
                  ),

                  const SizedBox(height: 32),

                  SizedBox(
                    width: double.infinity,
                    height: 54,

                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Community experiences are coming soon!',
                            ),
                          ),
                        );
                      },

                      icon: const Icon(
                        Icons.explore_outlined,
                      ),

                      label: const Text(
                        'Explore Local Experiences',
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}