import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_api/modules/explore/view/widgets/explore_wallpapers_grid_view_items.dart';
import 'package:flutter/material.dart';

class ExploreWallpapersGridView extends StatelessWidget {
  const ExploreWallpapersGridView({
    super.key, required this.wallpapers
  });

  final List<WallpaperModel> wallpapers;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
     itemCount: wallpapers.length,
     padding: EdgeInsets.all(12),
     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 1/1.4,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12
     ),
     itemBuilder: (context, index)
     {
      final wallpaper = wallpapers[index];
      return ExploreWallpapersGridViewItems(wallpaper: wallpaper);
     }
     );
  }
}
