import 'package:flutter/material.dart';
import 'package:pixel_art/pixel_art/screens/practice_screen_grid_builder.dart';
import 'package:pixel_art/pixel_art/view_model/pixel_art_view_model.dart';
import 'package:provider/provider.dart';

class PracticeScreenListView extends StatelessWidget {
  const PracticeScreenListView({super.key});

  @override
  Widget build(BuildContext context) {

    
    final listSquirrel = context.watch<PixelArtViewModel>().listSquirrel;
    final listBird = context.watch<PixelArtViewModel>().listBird;
    final listDog = context.watch<PixelArtViewModel>().listDog;



    return ListView(
      children: [
        SizedBox(
          child: PracticeScreenGridBuilder(listBird: listSquirrel)
        ),
 
        SizedBox(height: 50,),

        SizedBox(
          child: PracticeScreenGridBuilder(listBird: listDog),
        ),

        SizedBox(height: 50,),

        SizedBox(
          child: PracticeScreenGridBuilder(listBird: listBird)
        ), 
      ],
    );
  }
}