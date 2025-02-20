import 'package:firebase_api/modules/wallpaper/model/wallpaper_collection_model.dart';
import 'package:firebase_api/modules/wallpaper/view/widgets/wallpaper_collection_type_builder.dart';
import 'package:firebase_api/modules/wallpaper/view_model/wallpaper_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlertDialogToCreateCollection extends StatelessWidget {
  AlertDialogToCreateCollection({super.key});


  final collectionNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("New Collection"),
      content: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: collectionNameController,
                    validator: (input)
                    {
                      if(input == null) return "Name is required";
                      if(input.trim().length <= 5) return "Minimum 5 characters are required";
                      if(input.trim().isEmpty) return "Name is required";
                      return null;                     
                    },
                    decoration: InputDecoration(
                      hintText: "Collection Name",
                      prefixIcon: Icon(Icons.text_fields)
                    ),
                  ),
                  SizedBox(height: 20,),
                  WallpaperCollectionTypeBuilder(),
                ]
            ),
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("Cancel")),

        FilledButton(onPressed: () {
            _onAddButtonTapEvent(context);
          }, child: Text("Add")),
      ],
    );
  }

  void _onAddButtonTapEvent(BuildContext context) async{
    if(formKey.currentState?.validate() == true)
    {
      final parameter = collectionNameController.text.trim();
      final currentUser = context.read<WallpaperViewModel>().getUser();
      final collectionModel = WallpaperCollectionModel(
        userName: currentUser?.displayName, emailId: currentUser?.email,
        collectionName: parameter, category: context.read<WallpaperViewModel>().category);
      await context.read<WallpaperViewModel>().addToPublicCollectionEvent(
        collectionModel: collectionModel);

      Future.delayed(Duration(milliseconds: 100), () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      });
       
    }
  }

}