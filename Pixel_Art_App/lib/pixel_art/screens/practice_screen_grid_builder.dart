import 'package:flutter/material.dart';
import 'package:pixel_art/pixel_art/model/pixel_art_model.dart';
import 'package:pixel_art/pixel_art/screens/practice_screen_grid_view_item.dart';
import 'package:pixel_art/pixel_art/view_model/pixel_art_view_model.dart';
import 'package:provider/provider.dart';

class PracticeScreenGridBuilder extends StatelessWidget {
  const PracticeScreenGridBuilder({super.key
  , required this.listBird});

    final List<PixelArtModel> listBird;
    
  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: practiceScreenSize,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1
        ), 
      itemCount: listBird.length,
      itemBuilder: (context, index)
      {
        final model2 = listBird[index];
        return PracticeScreenGridViewItem(
          model: model2,
          onTap:  () => context.read<PixelArtViewModel>().paintPixelEventPractice(index, listBird)
        );
      },
      );
  }
}