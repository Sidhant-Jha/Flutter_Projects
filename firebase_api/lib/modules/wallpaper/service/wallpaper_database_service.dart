import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_api/modules/auth/services/auth_service.dart';
import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';
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

  DocumentReference<Map<String, dynamic>>? wallpaperPublicCollectionRef(WallpaperCollectionModel model)
  {

    return _client
      .collection('collections')
      .doc(jsonEncode(model.toMap()));
  }


  Future<void> addToPublicCollection(WallpaperCollectionModel collectionModel, WallpaperModel model) async
  {
    final ref = wallpaperPublicCollectionRef(collectionModel);
    if(ref == null) return;

    await ref.set(model.toMap());
  }

  Future<List<WallpaperCollectionModel>?> getAllPublicCollections() async {

    final ref = _client
      .collection('collections');

    try
    {
    final snapShot = await ref.get();
    final value = snapShot.docs.map((doc) => doc.id).toList();
    final va = value.map((value) => WallpaperCollectionModel.fromDatabaseMap(jsonDecode(value))).toList();
    return va;
    }
    catch(e, s)
    {
      log('createUser', name: '$runtimeType', error: e, stackTrace: s);
      return null;
    }
  }



}