import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_api/modules/wallpaper/view/wallpaper_screen.dart';
import 'package:firebase_api/modules/wallpaper/view_model/wallpaper_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WallpaperScreenProvider extends StatelessWidget {
  const WallpaperScreenProvider({super.key, required this.model});

  final WallpaperModel model;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => WallpaperViewModel(model: model),
    child: WallpaperScreen(),);
  }
}