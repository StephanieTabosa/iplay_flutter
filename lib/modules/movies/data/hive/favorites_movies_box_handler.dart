import 'package:hive_flutter/hive_flutter.dart';

class FavoritesMoviesBoxHandler {
  late Box _box;

  Future<void> openBox(String name) async {
    _box = await Hive.openBox(name);
  }

  Future<void> closeBox() async {
    await _box.close();
  }

  Future<void> addFavorite(int movieId) async {
    await _box.put(movieId, true);
  }

  Future<void> removeFavorite(int movieId) async {
    await _box.delete(movieId);
  }

  bool isFavorite(int movieId) {
    return _box.containsKey(movieId);
  }
}
