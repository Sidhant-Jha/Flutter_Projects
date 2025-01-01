import 'package:flutter/material.dart';
import 'package:pixel_art/pixel_art/view/pixel_art_draw_local_provider.dart';
import 'package:pixel_art/pixel_art/view/pixel_art_draw_screen.dart';
import 'package:pixel_art/pixel_art/view/widgets/pixel_art_material_app.dart';
import 'package:pixel_art/pixel_art/view_model/pixel_art_view_model.dart';
import 'package:pixel_art/pixel_art/view_model/pixel_art_view_model_global.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => GlobalPixelProvider(),),
      ChangeNotifierProvider(create: (context) => PixelArtViewModel())],
      child: PixelArtMaterialApp(),);
  }
}