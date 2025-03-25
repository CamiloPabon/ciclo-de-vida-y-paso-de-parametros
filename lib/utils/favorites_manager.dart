import '../models/item_model.dart';
import 'package:flutter/foundation.dart';

class FavoritesManager {
  static final List<Item> _favorites = [];

  static void toggleFavorite(Item item) {
    if (isFavorite(item)) {
      _favorites.removeWhere((fav) => fav.id == item.id);
      if (kDebugMode) {
        debugPrint("💔 Item ${item.title} eliminado de favoritos");
      }
    } else {
      _favorites.add(item);
      if (kDebugMode) {
        debugPrint("❤️ Item ${item.title} agregado a favoritos");
      }
    }
    // Mensaje genérico de cambio de estado
    if (kDebugMode) {
      debugPrint("Estado cambiado");
    }
  }

  static bool isFavorite(Item item) {
    return _favorites.any((fav) => fav.id == item.id);
  }

  static List<Item> get favorites => _favorites;
}
