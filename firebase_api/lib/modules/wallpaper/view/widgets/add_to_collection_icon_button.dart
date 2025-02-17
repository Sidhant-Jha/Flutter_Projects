import 'package:firebase_api/modules/wallpaper/view/dialogs/show_collection_bottom_sheet.dart';
import 'package:firebase_api/modules/wallpaper/view_model/wallpaper_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCollectionIconButton extends StatelessWidget {
  const AddToCollectionIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () => showBottomSheet(context), icon: Icon(Icons.add));
  }

  void showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    // backgroundColor: Theme.of(context).colorScheme.surface,
    backgroundColor: Colors.green.shade100,
    context: context,
    builder: (newContext) => ChangeNotifierProvider.value(
      value: context.read<WallpaperViewModel>(), // Pass the existing provider
      child: showCollectionBottomSheet(),
    ),
  );
}
}
