import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_api/modules/auth/services/auth_service.dart';
import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';

class FavouriteDatabaseServices{


  final _client = FirebaseFirestore.instance;
  final _authService = AuthService();


  Future<List<WallpaperModel>?> getAllFavourites() async {
    final currentUser = _authService.getUser();

    if(currentUser == null) return null;

    final ref = _client
      .collection('users')
      .doc(currentUser.uid)
      .collection('favourites');

    final snapShot = await ref.get();
    return snapShot.docs.map((doc) => WallpaperModel.fromMap(doc.data())).toList();
  }


}