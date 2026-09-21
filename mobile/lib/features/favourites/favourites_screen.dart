import 'package:flutter/material.dart';

import '../../app/theme/app_theme.dart';
import '../../data/mock/heritage_data.dart';
import '../../data/repositories/favourites_repository.dart';
import '../../core/widgets/destination_card.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: favouritesRepository,

      builder: (context, child) {
        final favouriteSites = heritageSites.where((site) {
          return favouritesRepository.isFavourite(site.id);
        }).toList();

        return Scaffold(
          appBar: AppBar(
            title: const Text('My Favourites'),
          ),

          body: favouriteSites.isEmpty
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(28),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 70,
                          color: AppTheme.primaryGreen,
                        ),

                        SizedBox(height: 20),

                        Text(
                          'No favourites yet',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 12),

                        Text(
                          'Explore heritage destinations and '
                          'save the places you would love to visit.',
                          textAlign: TextAlign.center,

                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                )

              : ListView.builder(
                  padding: const EdgeInsets.all(22),

                  itemCount: favouriteSites.length,

                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 18),

                      child: DestinationCard(
                        site: favouriteSites[index],
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}