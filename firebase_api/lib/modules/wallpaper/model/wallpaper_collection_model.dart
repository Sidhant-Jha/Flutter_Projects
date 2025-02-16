import 'package:firebase_api/modules/wallpaper/model/wallpaper_collection_type.dart';

class WallpaperCollectionModel {
  final String collectionName;
  final WallpaperCollectionType category;

  const WallpaperCollectionModel({required this.collectionName, required this.category});

  Map<String, dynamic> toMap()
  {
    return {
      'collectionName' : collectionName,
      'type' : category.name
    };
  }
}