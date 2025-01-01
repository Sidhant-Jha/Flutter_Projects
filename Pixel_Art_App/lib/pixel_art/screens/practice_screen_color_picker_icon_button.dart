import 'package:flutter/material.dart';
import 'package:pixel_art/pixel_art/dialogs/practice_screen_dialog_helper.dart';
import 'package:pixel_art/pixel_art/view_model/pixel_art_view_model.dart';
import 'package:provider/provider.dart';

class PracticeScreenColorPickerIconButton extends StatelessWidget {
  const PracticeScreenColorPickerIconButton({super.key});

  @override
  Widget build(BuildContext context) {

    final selectedColor = context.watch<PixelArtViewModel>().selectedColorPractice;
    final iconColor = ColorScheme.fromSeed(seedColor: selectedColor).onPrimaryContainer;

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => PracticeScreenDialogHelper.show(context),
      child: Ink(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selectedColor
        ),
        child: Icon(Icons.palette, color: iconColor,),
      ),
    );
  }
}