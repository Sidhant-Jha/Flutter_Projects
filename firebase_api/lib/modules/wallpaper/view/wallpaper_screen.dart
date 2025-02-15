import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_api/modules/wallpaper/view/widgets/add_to_collection_icon_button.dart';
import 'package:firebase_api/modules/wallpaper/view/widgets/favourite_wallpaper_icon_button.dart';
import 'package:firebase_api/modules/wallpaper/view_model/wallpaper_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WallpaperScreen extends StatefulWidget {
  const WallpaperScreen({super.key});

  @override
  State<WallpaperScreen> createState() => _WallpaperScreenState();
}

class _WallpaperScreenState extends State<WallpaperScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      if (mounted) context.read<WallpaperViewModel>().checkIsFavourite();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallpaper"),
        actions: [
          FavouriteWallpaperIconButton(),
          SizedBox(width: 20,),
          AddToCollectionIconButton()
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: 
          Image(
            image: NetworkImage(context.read<WallpaperViewModel>().model.src.large)
          ),
        )
      ),
    );
  }
}