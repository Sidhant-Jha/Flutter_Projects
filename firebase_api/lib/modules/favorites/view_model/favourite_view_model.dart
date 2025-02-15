import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_api/modules/favorites/service/favourite_database_services.dart';
import 'package:flutter/material.dart';


class FavouriteViewModel extends ChangeNotifier {
  final _service = FavouriteDatabaseServices();

  List<WallpaperModel> wallpapers = [];

  Future<void> fetchWallpapers() async {
    final result = await _service.getAllFavourites();
    wallpapers = result ?? [];
    notifyListeners();
  }
}
