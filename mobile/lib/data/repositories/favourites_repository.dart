import 'package:flutter/foundation.dart';

class FavouritesRepository extends ChangeNotifier {
  final Set<int> _favouriteIds = {};

  bool isFavourite(int siteId) {
    return _favouriteIds.contains(siteId);
  }

  Set<int> get favouriteIds {
    return Set.unmodifiable(_favouriteIds);
  }

  void toggleFavourite(int siteId) {
    if (_favouriteIds.contains(siteId)) {
      _favouriteIds.remove(siteId);
    } else {
      _favouriteIds.add(siteId);
    }

    notifyListeners();
  }
}

final favouritesRepository = FavouritesRepository();