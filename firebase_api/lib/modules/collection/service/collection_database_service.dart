import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_api/modules/wallpaper/model/public_collection_model.dart';
import 'package:firebase_api/modules/wallpaper/model/wallpaper_collection_model.dart';
import 'package:firebase_api/modules/wallpaper/model/wallpaper_collection_type.dart';


class CollectionDatabaseService {

  final _client = FirebaseFirestore.instance;

  Future<List<PublicCollectionModel>?> getAllPublicCollections() async {
    try
    {
      final QuerySnapshot<Map<String, dynamic>> collectionQuery = await _client.collection('collections').get();

      final collections = collectionQuery.docs.map((collection) => PublicCollectionModel.fromSnapShot(collection)).toList();

      log('$collections');

      return collections;
    }
    catch(e, s)
    {
      log('createUser', name: '$runtimeType', error: e, stackTrace: s);
        return null;
    }
  }

  Future<List<WallpaperModel>?> getPublicCollectionWallpapers(WallpaperCollectionModel model) async
  {
    try{
      final QuerySnapshot<Map<String, dynamic>> wallpaperQuery = await _client.collection('collections').doc(model.collectionName).collection('wallpapers').get();

      final wallpapers = wallpaperQuery.docs.map((wallpaper) => WallpaperModel.fromMap(wallpaper.data())).toList();

      log('$wallpapers');

      return wallpapers;
    }
    catch(e, s)
    {
      log('createUser', name: '$runtimeType', error: e, stackTrace: s);
      return null;
    }
  }

}