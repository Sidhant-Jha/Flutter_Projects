import 'package:firebase_api/modules/wallpaper/model/wallpaper_collection_type.dart';

class WallpaperCollectionModel {
  final String? userName;
  final String? emailId;
  final String? collectionName;
  final WallpaperCollectionType category;

  const WallpaperCollectionModel({required this.userName, required this.emailId, required this.collectionName, required this.category});

  factory WallpaperCollectionModel.fromDatabaseMap(Map<String, dynamic> map)
  {
    return WallpaperCollectionModel(
     userName: map['userName'] ?? "",
     emailId: map['emailId'] ?? "",
     collectionName : map['collectionName'] as String? ?? "dddd",
     category : mapToWallpaperType(map['category'] as String),
     
    );
  } 

  Map<String, dynamic> toMap()
  {
    return {
      'userName' : userName ?? "Unknown",
      'emailId' : emailId ?? "Unknown",
      'collectionName' : collectionName ?? "Unknown",
      'category' : category.name
    };
  }
}