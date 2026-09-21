import 'package:flutter/material.dart';

import '../../app/theme/app_theme.dart';
import '../../models/community_experience.dart';

class ExperienceDetailsScreen extends StatelessWidget {
  final CommunityExperience experience;

  const ExperienceDetailsScreen({
    super.key,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,

            backgroundColor: AppTheme.primaryGreen,
            foregroundColor: Colors.white,

            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                experience.imagePath,
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
                  const Text(
                    'COMMUNITY EXPERIENCE',
                    style: TextStyle(
                      color: AppTheme.accentOrange,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    experience.title,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: AppTheme.primaryGreen,
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: Text(
                          experience.location,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const Divider(),

                  const SizedBox(height: 20),

                  const Text(
                    'About this Experience',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    experience.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 28),

                  _infoRow(
                    Icons.person_outline,
                    'Hosted by',
                    experience.hostName,
                  ),

                  const SizedBox(height: 18),

                  _infoRow(
                    Icons.schedule,
                    'Duration',
                    '${experience.durationHours} hours',
                  ),

                  const SizedBox(height: 18),

                  _infoRow(
                    Icons.payments_outlined,
                    'Price per person',
                    'LKR ${experience.price.toStringAsFixed(0)}',
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: SizedBox(
            height: 54,

            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Booking feature is coming next!',
                    ),
                  ),
                );
              },

              child: const Text(
                'Book This Experience',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoRow(
    IconData icon,
    String label,
    String value,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppTheme.primaryGreen,
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}