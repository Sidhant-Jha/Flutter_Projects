import 'package:firebase_api/modules/wallpaper/model/wallpaper_collection_type.dart';

class WallpaperCollectionModel {
  final String? collectionName;
  final WallpaperCollectionType category;

  const WallpaperCollectionModel({required this.collectionName, required this.category});

  factory WallpaperCollectionModel.fromDatabaseMap(Map<String, dynamic> map)
  {
    return WallpaperCollectionModel(
     collectionName : map['collectionName'] as String? ?? "dddd",
     category : mapToWallpaperType(map['category'] as String),
     
    );
  } 

  Map<String, dynamic> toMap()
  {
    return {
      'collectionName' : collectionName,
      'category' : category.name
    };
  }
}