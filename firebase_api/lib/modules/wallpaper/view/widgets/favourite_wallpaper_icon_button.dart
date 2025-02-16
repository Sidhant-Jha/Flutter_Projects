import 'dart:developer';

import 'package:firebase_api/modules/wallpaper/view_model/wallpaper_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteWallpaperIconButton extends StatelessWidget {
  const FavouriteWallpaperIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<WallpaperViewModel, bool?>(
      selector: (context, vm) => vm.isFavourite,
      builder: (context, isFavourite, child) {
        return IconButton(
          icon: Icon(
            color: Colors.pink,
            isFavourite ?? false
                ? Icons.favorite_rounded
                : Icons.favorite_outline_rounded,
          ),
          onPressed: () {
            context.read<WallpaperViewModel>().addToFavouriteClickEvent();
          },
        );
      },
    );
  }
}