import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';
import 'package:flutter/material.dart';

class WallpaperScreen extends StatelessWidget {
  const WallpaperScreen({super.key, required this.model});

  final WallpaperModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallpaper"),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Image(
            image: NetworkImage(model.src.large)
          ),
        )
      ),
    );
  }
}