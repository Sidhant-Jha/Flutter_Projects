
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_api/modules/explore/service/explore_remote_service.dart';
import 'package:flutter/material.dart';

class ExploreViewModel extends ChangeNotifier {
  List<WallpaperModel> wallpapers = [];

  final _service = ExploreRemoteService();

  bool isVisible = true;

  void fetchWallpaper() async
  {
    isVisible = false;
    notifyListeners();

    final response = await _service.getWallpapers();
    response.fold((l) {

    }, (r) {
      wallpapers = r.photos;

      isVisible = true;
      // log('dd');
      notifyListeners();
    });
  }
}