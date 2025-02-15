import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_api/modules/wallpaper/service/wallpaper_database_service.dart';
import 'package:flutter/material.dart';

class WallpaperViewModel extends ChangeNotifier
{
  WallpaperViewModel({required this.model});

  final WallpaperModel model;

  final _service = WallpaperDatabaseService();

  bool? isFavourite;

  void checkIsFavourite() async {
    isFavourite = await _service.checkIsFavourite(model);
    notifyListeners();
  }

  void addToFavouriteClickEvent() async
  {
    if(isFavourite == true)
    {
      await _service.removeFromFavourites(model);
      isFavourite = false;
    }
    else 
    {
      await _service.addToFavourites(model);
      isFavourite = true;
    }
    notifyListeners();
  }
}