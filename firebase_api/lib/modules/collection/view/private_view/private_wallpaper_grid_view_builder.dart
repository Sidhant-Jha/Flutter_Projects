import 'package:firebase_api/modules/collection/view_model/collection_view_model.dart';
import 'package:firebase_api/modules/explore/model/wallpaper_model.dart';
import 'package:firebase_api/modules/explore/view/widgets/explore_wallpapers_grid_view.dart';
import 'package:firebase_api/modules/wallpaper/model/wallpaper_collection_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrivateWallpaperGridViewBuilder extends StatefulWidget {
  const PrivateWallpaperGridViewBuilder({super.key, required this.model});


  final WallpaperCollectionModel model;

  @override
  State<PrivateWallpaperGridViewBuilder> createState() => _PrivateWallpaperGridViewBuilderState();
}

class _PrivateWallpaperGridViewBuilderState extends State<PrivateWallpaperGridViewBuilder> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(()
    {
      context.read<CollectionViewModel>().getPrivateCollectionWallpapersEvent(widget.model);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Selector<CollectionViewModel, List<WallpaperModel>>(
      selector: (_, vm) => vm.wallpapers,
      builder: (context, wallpapers, child) {
        return Scaffold(
        appBar: AppBar(title: Text("Wallpapers"),),
        body: ExploreWallpapersGridView(wallpapers: wallpapers));
      },
    );
  }
}