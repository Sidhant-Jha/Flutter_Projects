import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_api/modules/explore/view/widgets/explore_wallpapers_grid_view.dart';
import 'package:firebase_api/modules/favorites/view_model/favourite_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      if (mounted) context.read<FavouriteViewModel>().fetchWallpapers();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Selector<FavouriteViewModel, List<WallpaperModel>>(
      selector: (context, vm) => vm.wallpapers,
      builder: (context, wallpapers, child) {
        return RefreshIndicator(
          onRefresh: context.read<FavouriteViewModel>().fetchWallpapers,
          child: ExploreWallpapersGridView(wallpapers: wallpapers)
        );
      },
    );
  }
}