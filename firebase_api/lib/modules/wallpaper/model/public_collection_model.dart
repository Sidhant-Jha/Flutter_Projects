import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_api/modules/wallpaper/model/wallpaper_collection_model.dart';
import 'package:firebase_api/modules/wallpaper/model/wallpaper_collection_type.dart';

class PublicCollectionModel {
  final List wallpaper;
  final WallpaperCollectionModel model;

  const PublicCollectionModel({required this.wallpaper, required this.model});

  factory PublicCollectionModel.fromSnapShot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
  {
    return PublicCollectionModel(wallpaper: [], model: WallpaperCollectionModel(collectionName: snapshot['collectionName'], category: mapToWallpaperType(snapshot['category'] as String)));
  }

}