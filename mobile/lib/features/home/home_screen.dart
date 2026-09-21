import 'package:flutter/material.dart';
import '../../data/mock/heritage_data.dart';
import '../../app/theme/app_theme.dart';
import '../../core/widgets/destination_card.dart';
import '../favourites/favourites_screen.dart';
import '../../data/mock/experience_data.dart';
import '../../core/widgets/experience_card.dart';
import '../bookings/bookings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: [
            _buildExplorePage(),

            const FavouritesScreen(),

            const BookingsScreen(),

            const Center(
              child: Text('Profile - Coming Soon'),
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
    final filteredSites = heritageSites.where((site) {
      final query = searchQuery.trim().toLowerCase();

      return site.name.toLowerCase().contains(query) ||
          site.location.toLowerCase().contains(query) ||
          site.category.toLowerCase().contains(query);
    }).toList();

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
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },

              decoration: InputDecoration(
                hintText: 'Search heritage destinations',

                prefixIcon: const Icon(
                  Icons.search,
                  color: AppTheme.primaryGreen,
                ),

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

            filteredSites.isEmpty
                ? Container(
                    height: 180,
                    width: double.infinity,

                    alignment: Alignment.center,

                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Icon(
                          Icons.search_off,
                          size: 48,
                          color: Colors.grey,
                        ),

                        SizedBox(height: 12),

                        Text(
                          'No destinations found',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textDark,
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          'Try searching with another keyword.',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )

                : SizedBox(
                    height: 235,

                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,

                      itemCount: filteredSites.length,

                      itemBuilder: (context, index) {
                        return DestinationCard(
                          site: filteredSites[index],
                        );
                      },
                    ),
                  ),

            const SizedBox(height: 34),

            _buildSectionTitle(
              'Community Experiences',
              'Connect with local culture and traditions',
            ),

            const SizedBox(height: 18),

            ...communityExperiences.map(
              (experience) => ExperienceCard(
                experience: experience,
              ),
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
}