import 'dart:developer';

import 'package:firebase_api/modules/collection/view/public_collection_page.dart';
import 'package:firebase_api/modules/wallpaper/model/wallpaper_collection_model.dart';
import 'package:firebase_api/modules/wallpaper/view/dialogs/alert_dialog_to_create_collection.dart';
import 'package:firebase_api/modules/wallpaper/view_model/wallpaper_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowCollectionBottomSheet extends StatefulWidget {
  const ShowCollectionBottomSheet({
    super.key,
  });

  @override
  State<ShowCollectionBottomSheet> createState() => _ShowCollectionBottomSheetState();
}

class _ShowCollectionBottomSheetState extends State<ShowCollectionBottomSheet> {



  @override
  void initState() {
    super.initState();
    context.read<WallpaperViewModel>().getAllPublicCollectionsEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<WallpaperViewModel, List<WallpaperCollectionModel>>(
      selector: (_, vm) => vm.publicCollections,
      builder: (context, publicCollections, child) {
      return  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              child: Text("Collections", style: Theme.of(context).textTheme.headlineMedium),
            ),
          ),
          FilledButton(
            onPressed: () {
            log(context.read<WallpaperViewModel>().category.name);
            Navigator.of(context).pop();
            alertDialogToCreateCollection(context);
          }, child: Text("Create New Collection")),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              itemCount: publicCollections.length,
              itemBuilder: (context, index)
              {
                final publicCollection = publicCollections[index];
                log(publicCollection.toString());
                return ListTile(
                  tileColor: Colors.green.shade200,
                  title: Text('${publicCollection.collectionName!}', style: Theme.of(context).textTheme.titleLarge,),
                  subtitle: Text(publicCollection.category.name, style: Theme.of(context).textTheme.bodyMedium),
                  trailing: IconButton(onPressed: () {
                    context.read<WallpaperViewModel>().addToPublicCollectionEvent(collectionModel: publicCollection);
                  }, icon: Icon(Icons.add_circle_outline_outlined)),
                );
              }
            ),
          )
        ],
      );

      });

  }

  void alertDialogToCreateCollection(BuildContext context)
  {
    showDialog(context: context, builder: (_) => ChangeNotifierProvider.value(
      value: context.read<WallpaperViewModel>(), // Pass the existing provider
      child: AlertDialogToCreateCollection(),
    ));
  }
}