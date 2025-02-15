import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_api/modules/auth/services/auth_service.dart';
import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  // Future<void> addOrRemoveFromFavourites(WallpaperModel model) async
  // {
  //   final currentUser = await _authService.getUser();
  //   if (currentUser == null) return null;
  //   final ref = _client
  //       .collection('users')
  //       .doc(currentUser.uid)
  //       .collection('favourites')
  //       .doc(model.id.toString());

  //   final isAlreadyFavourited = await ref.get().then((value) => value.exists);

  //   if(isAlreadyFavourited)
  //   {
  //     await ref.delete();
  //   }
  //   else
  //   {
  //     await ref.set(model.toMap());
  //   }
  // }

}