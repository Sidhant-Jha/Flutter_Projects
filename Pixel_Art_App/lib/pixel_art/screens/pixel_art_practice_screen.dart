import 'package:flutter/material.dart';
import 'package:pixel_art/pixel_art/screens/practice_screen_color_picker_icon_button.dart';
import 'package:pixel_art/pixel_art/screens/practice_screen_list_view.dart';
import 'package:pixel_art/pixel_art/view_model/pixel_art_view_model.dart';
import 'package:pixel_art/pixel_art/view_model/pixel_art_view_model_global.dart';
import 'package:provider/provider.dart';

class PixelArtPracticeScreen extends StatelessWidget {
  const PixelArtPracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Practice"),
      actions: [
          FilledButton(onPressed: ()=> context.read<PixelArtViewModel>().clearPracticeScreen(), child: Text("Clear"),),

          SizedBox(width: 25),

          IconButton.filledTonal(
          onPressed: ()=> context.read<GlobalPixelProvider>().changeTheme(),
          icon: Icon(Icons.brightness_6)
          ),

          SizedBox(width: 25),

          PracticeScreenColorPickerIconButton(),

          SizedBox(width: 20),
      

      ],),
      body: PracticeScreenListView(),
    );
  }
}