import 'package:flutter/material.dart';

import '../../app/theme/app_theme.dart';
import '../../core/widgets/destination_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: [
            _buildExplorePage(),

            const Center(
              child: Text('Favourites — Coming Soon'),
            ),

            const Center(
              child: Text('Bookings — Coming Soon'),
            ),

            const Center(
              child: Text('Profile — Coming Soon'),
            ),
          ],
        ),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,

        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Explore',
          ),

          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favourites',
          ),

          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            selectedIcon: Icon(Icons.calendar_month),
            label: 'Bookings',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildExplorePage() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(22),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const SizedBox(height: 12),

            const Text(
              'Ayubowan! 👋',
              style: TextStyle(
                fontSize: 16,
                color: AppTheme.secondaryGreen,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Where will you\nexplore today?',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
                height: 1.2,
              ),
            ),

            const SizedBox(height: 26),

            TextField(
              decoration: InputDecoration(
                hintText: 'Search heritage destinations',

                prefixIcon: const Icon(Icons.search),

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 32),

            _buildSectionTitle(
              'Explore Heritage',
              'Discover remarkable historical places',
            ),

            const SizedBox(height: 18),

            SizedBox(
              height: 250,

              child: ListView(
                scrollDirection: Axis.horizontal,

                children: const [
                  DestinationCard(
                    name: 'Sigiriya',
                    location: 'Matale District',
                    imagePath: 'assets/images/sigiriya.jpeg',
                    category: 'Ancient Fortress',
                  ),

                  DestinationCard(
                    name: 'Yapahuwa',
                    location: 'Kurunegala District',
                    imagePath: 'assets/images/yapahuwa.jpeg',
                    category: 'Historical Kingdom',
                  ),

                  DestinationCard(
                    name: 'Ritigala',
                    location: 'Anuradhapura District',
                    imagePath: 'assets/images/ritigala.jpeg',
                    category: 'Forest Monastery',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 34),

            _buildSectionTitle(
              'Community Experiences',
              'Connect with local culture and traditions',
            ),

            const SizedBox(height: 18),

            _buildExperienceCard(
              'Traditional Pottery',
              'Discover Sri Lankan craftsmanship',
              Icons.palette_outlined,
            ),

            const SizedBox(height: 12),

            _buildExperienceCard(
              'Village Cooking',
              'Experience authentic local cuisine',
              Icons.restaurant_outlined,
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
    String title,
    String subtitle,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppTheme.textDark,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildExperienceCard(
    String title,
    String subtitle,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(14),

            decoration: BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.circular(12),
            ),

            child: Icon(
              icon,
              color: AppTheme.primaryGreen,
              size: 28,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}