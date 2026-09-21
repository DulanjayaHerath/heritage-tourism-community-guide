import 'package:flutter/material.dart';

import '../../app/theme/app_theme.dart';
import '../../data/repositories/booking_repository.dart';
import '../../data/repositories/favourites_repository.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onBookingsTap;
  final VoidCallback onFavouritesTap;

  const ProfileScreen({
    super.key,
    required this.onBookingsTap,
    required this.onFavouritesTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // Profile header

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),

              decoration: BoxDecoration(
                color: AppTheme.primaryGreen,
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 42,
                    backgroundColor: Colors.white,

                    child: Icon(
                      Icons.person,
                      size: 48,
                      color: AppTheme.primaryGreen,
                    ),
                  ),

                  SizedBox(height: 16),

                  Text(
                    'Welcome, Explorer!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Discover the heritage of Sri Lanka',
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Statistics

            ListenableBuilder(
              listenable: Listenable.merge([
                favouritesRepository,
                bookingRepository,
              ]),

              builder: (context, child) {
                return Row(
                  children: [
                    Expanded(
                      child: _statCard(
                        Icons.favorite,
                        '${favouritesRepository.favouriteIds.length}',
                        'Favourites',
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: _statCard(
                        Icons.calendar_month,
                        '${bookingRepository.bookings.length}',
                        'Bookings',
                      ),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 32),

            const Text(
              'My Account',

              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: AppTheme.textDark,
              ),
            ),

            const SizedBox(height: 16),

            _menuItem(
              Icons.favorite_border,
              'My Favourites',
              'View your saved heritage destinations',
              onFavouritesTap,
            ),

            _menuItem(
              Icons.calendar_month_outlined,
              'My Bookings',
              'Manage your community experiences',
              onBookingsTap,
            ),

            _menuItem(
              Icons.person_outline,
              'Personal Information',
              'Manage your account details',
              () {
                _showComingSoon(context);
              },
            ),

            _menuItem(
              Icons.settings_outlined,
              'Settings',
              'App preferences and notifications',
              () {
                _showComingSoon(context);
              },
            ),

            const SizedBox(height: 28),

            const Center(
              child: Text(
                'Heritage Tourism & Community Guide\nVersion 1.0.0',
                textAlign: TextAlign.center,

                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statCard(
    IconData icon,
    String count,
    String label,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        children: [
          Icon(
            icon,
            color: AppTheme.primaryGreen,
            size: 28,
          ),

          const SizedBox(height: 10),

          Text(
            count,

            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            label,

            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),

      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),

        leading: Icon(
          icon,
          color: AppTheme.primaryGreen,
        ),

        title: Text(
          title,

          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(subtitle),

        trailing: const Icon(
          Icons.chevron_right,
        ),

        onTap: onTap,
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'This feature will be available after backend integration.',
        ),
      ),
    );
  }
}