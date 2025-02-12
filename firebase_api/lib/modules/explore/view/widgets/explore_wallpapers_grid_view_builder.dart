import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_api/modules/explore/view_model/explore_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExploreWallpapersGridViewBuilder extends StatefulWidget {
  const ExploreWallpapersGridViewBuilder({super.key});

  @override
  State<ExploreWallpapersGridViewBuilder> createState() => _ExploreWallpapersGridViewBuilderState();
}

class _ExploreWallpapersGridViewBuilderState extends State<ExploreWallpapersGridViewBuilder> {


  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) context.read<ExploreViewModel>().fetchWallpaper();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Selector<ExploreViewModel, List<WallpaperModel>>(
      selector: (_, vm) => vm.wallpapers,
      builder: (context, wallpapers, child) {
        return GridView.builder(
         itemCount: wallpapers.length,
         padding: EdgeInsets.all(12),
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1/1.25,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12
         ),
         itemBuilder: (context, index)
         {
          final wallpaper = wallpapers[index];
          return Container(
            decoration: BoxDecoration(
              // border: Border.all(),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(wallpaper.src.medium)),
              borderRadius: BorderRadius.circular(12)
            ),
          );
         }
         );
      },
    );
  }
}