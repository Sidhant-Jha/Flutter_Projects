import 'package:firebase_api/modules/collection/view/private_view/private_wallpaper_grid_view_builder.dart';
import 'package:firebase_api/modules/collection/view_model/collection_view_model.dart';
import 'package:firebase_api/modules/wallpaper/model/wallpaper_collection_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrivateCollectionsGridViewBuilder extends StatefulWidget {
  const PrivateCollectionsGridViewBuilder({super.key});

  @override
  State<PrivateCollectionsGridViewBuilder> createState() => _PrivateCollectionsGridViewBuilderState();
}

class _PrivateCollectionsGridViewBuilderState extends State<PrivateCollectionsGridViewBuilder> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CollectionViewModel>().getAllPrivateCollectionsEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<CollectionViewModel, List<WallpaperCollectionModel>>(
      selector: (context, vm) => vm.privateCollections,
      builder: (context, privateCollections, child) {
        return GridView.builder(
          itemCount: privateCollections.length,
          padding: EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1/1.4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12
          ),
          itemBuilder: (context, index)
          {
            final collection = privateCollections[index];
            return GestureDetector(
              onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeNotifierProvider.value(child: PrivateWallpaperGridViewBuilder(model: collection), value: CollectionViewModel(),)));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(collection.collectionName!),
                ),
              ),
            );
          }
        );
      }
    );
  }
}