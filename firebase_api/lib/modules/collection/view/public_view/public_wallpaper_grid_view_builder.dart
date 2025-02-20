import 'package:firebase_api/modules/collection/view_model/collection_view_model.dart';
import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_api/modules/explore/view/widgets/explore_wallpapers_grid_view.dart';
import 'package:firebase_api/modules/wallpaper/model/wallpaper_collection_model.dart';
import 'package:firebase_api/modules/wallpaper/model/wallpaper_collection_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublicWallpaperGridViewBuilder extends StatefulWidget {
  const PublicWallpaperGridViewBuilder({super.key, required this.model});

  final WallpaperCollectionModel model;

  @override
  State<PublicWallpaperGridViewBuilder> createState() => _PublicWallpaperGridViewBuilderState();
}

class _PublicWallpaperGridViewBuilderState extends State<PublicWallpaperGridViewBuilder> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(()
    {
      context.read<CollectionViewModel>().getPublicCollectionWallpapersEvent(widget.model);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Selector<CollectionViewModel, List<WallpaperModel>>(
      selector: (_, vm) => vm.wallpapers,
      builder: (context, wallpapers, child) {
        return ExploreWallpapersGridView(wallpapers: wallpapers);
      },
    );
  }
}