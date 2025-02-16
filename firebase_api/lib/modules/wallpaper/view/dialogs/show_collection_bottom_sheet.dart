import 'dart:developer';

import 'package:firebase_api/modules/wallpaper/view/dialogs/alert_dialog_to_create_collection.dart';
import 'package:firebase_api/modules/wallpaper/view_model/wallpaper_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class showCollectionBottomSheet extends StatelessWidget {
  const showCollectionBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            child: Text("Collections", style: Theme.of(context).textTheme.headlineMedium,),
          ),
        ),
        TextButton(onPressed: () {
          log(context.read<WallpaperViewModel>().category.name);
          Navigator.of(context).pop();
          alertDialogToCreateCollection(context);
        }, child: Text("Create New Collection")),
        SizedBox(height: 20,),
        Expanded(
          child: ListView.builder(
    
            itemBuilder: (context, index)
            {
              
            }
          )
        )
      ],
    );
  }

  void alertDialogToCreateCollection(BuildContext context)
  {
    showDialog(context: context, builder: (_) => ChangeNotifierProvider.value(
      value: context.read<WallpaperViewModel>(), // Pass the existing provider
      child: AlertDialogToCreateCollection(),
    ));
  }
}