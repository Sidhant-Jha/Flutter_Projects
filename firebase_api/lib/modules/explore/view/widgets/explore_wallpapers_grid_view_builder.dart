import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_api/modules/explore/view/widgets/explore_wallpapers_grid_view.dart';
import 'package:firebase_api/modules/explore/view/widgets/explore_wallpapers_grid_view_items.dart';
import 'package:firebase_api/modules/explore/view_model/explore_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExploreWallpapersGridViewBuilder extends StatefulWidget {
  const ExploreWallpapersGridViewBuilder({super.key, this.wallpapers});

  final List<WallpaperModel>? wallpapers;

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
        return ExploreWallpapersGridView(wallpapers: wallpapers,);
      },
    );
  }
}

