import 'package:flutter/material.dart';
import 'package:pixel_art/pixel_art/screens/pixel_art_play.dart';
import 'package:pixel_art/pixel_art/view/pixel_art_draw_local_provider.dart';
import 'package:pixel_art/pixel_art/view_model/pixel_art_view_model_global.dart';
import 'package:provider/provider.dart';

class PixelArtMaterialApp extends StatelessWidget {
  const PixelArtMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {

    ThemeData themeData = context.watch<GlobalPixelProvider>().themeData;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,
        home: PixelArtPlay()
      );

  }
}