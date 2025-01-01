import 'package:flutter/material.dart';
import 'package:pixel_art/pixel_art/dialogs/pixel_art_dialog_helper.dart';
import 'package:pixel_art/pixel_art/model/pixel_art_model.dart';
import 'package:pixel_art/pixel_art/view/pixel_art_draw_local_provider.dart';
import 'package:pixel_art/pixel_art/view/widgets/pixel_art_grid_view_builder.dart';
import 'package:pixel_art/pixel_art/view_model/pixel_art_view_model.dart';
import 'package:pixel_art/pixel_art/view_model/pixel_art_view_model_global.dart';
import 'package:provider/provider.dart';

// const size = 24;
// List<int> list = List.generate(size * size, (index)=> index);
class PixelArtDrawScreen extends StatelessWidget {
  const PixelArtDrawScreen({super.key});


  @override
  Widget build(BuildContext context) {

    // final list = context.watch<PixelArtViewModel>().list;
  
    final selectedColor = context.watch<PixelArtViewModel>().selectedColor;
    final iconColor = ColorScheme.fromSeed(seedColor: selectedColor).onPrimaryContainer;
    final list = context.read<PixelArtViewModel>().list;

    return Scaffold(
      appBar: AppBar(title: Text("Draw"),
      actions: [
        FilledButton(onPressed: ()=> context.read<PixelArtViewModel>().clearScreen(list), child: Text("Clear"),),

        SizedBox(width: 30),

        IconButton.filledTonal(
          onPressed: ()=> context.read<GlobalPixelProvider>().changeTheme(),
          icon: Icon(Icons.brightness_6)
          ),
          
          SizedBox(width: 30),


        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => PixelArtDialogHelper.show(context),
          child: Ink(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedColor,
            ),
            child: Icon(Icons.palette, color: iconColor,),
          ),
        ),
          SizedBox(width: 20),
      

      ],
      elevation: 2,
      shadowColor: Colors.black,),
      body: PixelArtGridViewBuilder(),
    );
  }
}
