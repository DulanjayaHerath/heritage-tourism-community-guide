import 'package:flutter/material.dart';

import '../../models/community_experience.dart';
import '../../features/experiences/experience_details_screen.dart';

class ExperienceCard extends StatelessWidget {
  final CommunityExperience experience;

  const ExperienceCard({
    super.key,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,

      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExperienceDetailsScreen(
                experience: experience,
              ),
            ),
          );
        },

        child: Row(
          children: [
            Image.asset(
              experience.imagePath,
              width: 110,
              height: 115,
              fit: BoxFit.cover,
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      experience.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      experience.location,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'LKR ${experience.price.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B4332),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}