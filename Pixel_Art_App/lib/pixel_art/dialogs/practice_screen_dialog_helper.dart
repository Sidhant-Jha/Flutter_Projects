import 'package:flutter/material.dart';
import 'package:pixel_art/pixel_art/dialogs/pixel_art_dialog.dart';
import 'package:pixel_art/pixel_art/dialogs/practice_screen_dialog.dart';
import 'package:pixel_art/pixel_art/view_model/pixel_art_view_model.dart';
import 'package:provider/provider.dart';

class PracticeScreenDialogHelper{
  static void show(BuildContext context) async
  {
    final current = context.read<PixelArtViewModel>().selectedColorPractice;
    final picked = await showDialog<Color>(
      context : context,
      builder : (context)
      {
        return PracticeScreenDialog(currentColor: current);
      }
    ).then((picked) {
      context.read<PixelArtViewModel>().changeSelectedPractice(picked);
      print(picked);
    }
    );
}
}