import 'package:firebase_api/modules/collection/view/public_view/public_wallpaper_grid_view_builder.dart';
import 'package:firebase_api/modules/collection/view_model/collection_view_model.dart';
import 'package:firebase_api/modules/wallpaper/model/public_collection_model.dart';
import 'package:firebase_api/modules/wallpaper/model/wallpaper_collection_model.dart';
import 'package:firebase_api/modules/wallpaper/view_model/wallpaper_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublicCollectionsGridViewBuilder extends StatefulWidget {
  const PublicCollectionsGridViewBuilder({super.key});

  @override
  State<PublicCollectionsGridViewBuilder> createState() => _PublicCollectionsGridViewBuilderState();
}

class _PublicCollectionsGridViewBuilderState extends State<PublicCollectionsGridViewBuilder> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      if (mounted) context.read<CollectionViewModel>().getAllPublicCollectionsEvent();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Selector<CollectionViewModel, List<PublicCollectionModel>>(
      selector: (context, vm) => vm.publicCollections,
      builder: (context, publicCollections, child) {
        return Selector<CollectionViewModel, bool>(
          selector: (_, vm) => vm.isVisible,
          builder: (context, isVisible, child) {
            if(!isVisible){
              return Center(child: CircularProgressIndicator(),);
            }
            return GridView.builder(
          itemCount: publicCollections.length,
          padding: EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1/1.4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12
          ),
          itemBuilder: (context, index)
          {
            final collection = publicCollections[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChangeNotifierProvider.value(child: PublicWallpaperGridViewBuilder(model: collection.model), value: CollectionViewModel(),)));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12),
                  // image: DecorationImage(
                  // fit: BoxFit.cover,
                  // image: NetworkImage(collection.wallpa)),
                ),
                  alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                        Expanded(child: Center(child: Text(collection.model.collectionName!, style: Theme.of(context).textTheme.titleMedium))),
                        Container(
                            padding: EdgeInsets.all(8),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12), 
                              ),
                              color: Colors.black45
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  collection.model.userName!,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.white
                                  )
                                  
                                ),
                                SizedBox(height: 5,),
                                Text(collection.model.emailId!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.white
                                  ))
                              ],
                            ),
                          ),
                      ]
                  ),
                ),
            );
          }
        );
          },
        );
        
        
      },
    );
  }
}


// class ExploreWallpapersGridViewBuilder extends StatefulWidget {
//   const ExploreWallpapersGridViewBuilder({super.key});

//   @override
//   State<ExploreWallpapersGridViewBuilder> createState() => _ExploreWallpapersGridViewBuilderState();
// }

// class _ExploreWallpapersGridViewBuilderState extends State<ExploreWallpapersGridViewBuilder> {


//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(() {
//       if (mounted) context.read<ExploreViewModel>().fetchWallpaper();
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Selector<ExploreViewModel, List<WallpaperModel>>(
//       selector: (_, vm) => vm.wallpapers,
//       builder: (context, wallpapers, child) {
//         return ExploreWallpapersGridView(wallpapers: wallpapers,);
//       },
//     );
//   }
// }
