import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_api/modules/explore/view/widgets/explore_wallpapers_grid_view.dart';
import 'package:firebase_api/modules/explore/view_model/explore_view_model.dart';
import 'package:firebase_api/modules/favorites/view_model/favourite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesPageRefreshIndicator extends StatelessWidget {
  const FavouritesPageRefreshIndicator({super.key, required this.wallpapers});

  final List<WallpaperModel> wallpapers;
  
  @override
  Widget build(BuildContext context) {
    return Selector<ExploreViewModel, bool>(
      selector: (_, vm) => vm.isVisible,
      builder: (context, isVisible, child) {
        context.read<ExploreViewModel>().fetchWallpaper();
        if(!isVisible) {
        return Center(child: CircularProgressIndicator(),);
        }

        return RefreshIndicator(
          onRefresh: context.read<FavouriteViewModel>().fetchWallpapers,
          child: ExploreWallpapersGridView(wallpapers: wallpapers)
        );

      },
    );
    
  }
}