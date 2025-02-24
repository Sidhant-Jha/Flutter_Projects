import 'package:firebase_api/modules/collection/service/collection_database_service.dart';
import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_api/modules/wallpaper/model/public_collection_model.dart';
import 'package:firebase_api/modules/wallpaper/model/wallpaper_collection_model.dart';
import 'package:flutter/material.dart';

class CollectionViewModel extends ChangeNotifier
{

  final _service = CollectionDatabaseService();
  List<PublicCollectionModel> publicCollections = [];
  List<WallpaperCollectionModel> privateCollections = [];
  List<WallpaperModel> wallpapers = [];

  bool isVisible = true;

  Future<void> getAllPublicCollectionsEvent() async {
    isVisible = false;
    notifyListeners();

    final result = await _service.getAllPublicCollections();
    publicCollections = result ?? [];

    isVisible = true;
    notifyListeners();
  }

  Future<void> getAllPrivateCollectionsEvent() async {
    isVisible = false;
    notifyListeners();

    final result = await _service.getAllPrivateCollections();
    privateCollections = result ?? [];
    
    isVisible = true;
    notifyListeners();
  }

  Future<void> getPublicCollectionWallpapersEvent(WallpaperCollectionModel model) async {
    final result = await _service.getPublicCollectionWallpapers(model);
    wallpapers = result ?? [];
    notifyListeners();
  }

  Future<void> getPrivateCollectionWallpapersEvent(WallpaperCollectionModel model) async {
    final result = await _service.getPrivateCollectionWallpapers(model);
    wallpapers = result ?? [];
    notifyListeners();
  }


}