import 'package:flutter/material.dart';
import 'package:pixel_art/pixel_art/view/pixel_art_draw_screen.dart';
import 'package:pixel_art/pixel_art/view_model/pixel_art_view_model.dart';
import 'package:provider/provider.dart';

class PixelArtDrawLocalProvider extends StatelessWidget {
  const PixelArtDrawLocalProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return PixelArtDrawScreen();
  }
}