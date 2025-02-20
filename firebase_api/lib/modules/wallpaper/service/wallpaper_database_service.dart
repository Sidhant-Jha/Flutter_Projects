import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_api/modules/auth/services/auth_service.dart';
import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_api/modules/wallpaper/model/public_collection_model.dart';
import 'package:firebase_api/modules/wallpaper/model/wallpaper_collection_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WallpaperDatabaseService {


  final _client = FirebaseFirestore.instance;
  final _authService = AuthService();

  //going till .doc in firestore that's why DocumentReference if till .collection then CollectionRefernce

  DocumentReference<Map<String, dynamic>>? wallpaperRef(WallpaperModel model)
  {
    final currentUser = _authService.getUser();
    if(currentUser == null) return null;

    return _client
      .collection('users')
      .doc(currentUser.uid)
      .collection('favourites')
      .doc(model.id.toString());
  }

  Future<bool?> checkIsFavourite(WallpaperModel model) async
  {
    final ref = wallpaperRef(model);
    if(ref == null) return null;
    return await ref.get().then((value) => value.exists);
  }

  Future<void> addToFavourites(WallpaperModel model) async
  {
    final ref = wallpaperRef(model);
    if(ref == null) return;

    await ref.set(model.toMap());
  }

  Future<void> removeFromFavourites(WallpaperModel model) async
  {
    final ref = wallpaperRef(model);
    if(ref == null) return;

    await ref.delete();
  }

  DocumentReference<Map<String, dynamic>>? publicCollectionRef(WallpaperCollectionModel collectionModel, WallpaperModel model)
  {

    return _client
      .collection('collections')
      .doc(collectionModel.collectionName);
      
  }

  DocumentReference<Map<String, dynamic>>? publicWallpaperCollectionRef(WallpaperCollectionModel collectionModel, WallpaperModel model)
  {

    return _client
      .collection('collections')
      .doc(collectionModel.collectionName)
      .collection('wallpapers')
      .doc(model.id.toString());
      
  }


  Future<void> addToPublicCollection(WallpaperCollectionModel collectionModel, WallpaperModel model) async
  { 
    final ref2 = publicWallpaperCollectionRef(collectionModel, model);
    if(ref2 == null) return;

    final wallpaperSnapShot = await ref2.get();
    if(wallpaperSnapShot.exists)
    {
      return;
    }

    final ref = publicCollectionRef(collectionModel, model);
    if(ref == null) return;

    await ref.set(collectionModel.toMap());

    await ref2.set(model.toMap());
  }

  Future<List<WallpaperCollectionModel>?> getAllPublicCollections() async {
    
  try
  {
    final QuerySnapshot<Map<String, dynamic>> collectionQuery = await _client.collection('collections').get();

    final collections = collectionQuery.docs.map((collection) => PublicCollectionModel.fromSnapShot(collection).model).toList();

    log('$collections');

    return collections;
  }
  catch(e, s)
  {
     log('createUser', name: '$runtimeType', error: e, stackTrace: s);
      return null;
  }

  }



}