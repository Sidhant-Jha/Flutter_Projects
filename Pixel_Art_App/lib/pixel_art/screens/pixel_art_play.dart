import 'package:flutter/material.dart';
import 'package:pixel_art/pixel_art/screens/pixel_art_practice_screen.dart';
import 'package:pixel_art/pixel_art/screens/practice_screen_list_view.dart';
// import 'package:pixel_art/pixel_art/screens/pixel_art_select_option.dart';
import 'package:pixel_art/pixel_art/view/pixel_art_draw_local_provider.dart';
import 'package:pixel_art/pixel_art/view/pixel_art_draw_screen.dart';
import 'package:pixel_art/pixel_art/view_model/pixel_art_view_model_global.dart';
import 'package:provider/provider.dart';

class PixelArtPlay extends StatelessWidget {
  const PixelArtPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pixel Art"),
        elevation: 2,
        shadowColor: Colors.black,
        actions: [
          IconButton.filledTonal(
          onPressed: ()=> context.read<GlobalPixelProvider>().changeTheme(),
          icon: Icon(Icons.brightness_6)
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 400,
                width: 400,
                child: Image.asset('assets/playScreen.png')),
              SizedBox(height: 40,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    FilledButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  PixelArtDrawLocalProvider())),
                    child: Text("Draw", style: TextStyle(fontSize: 30),)),
                    SizedBox(width: 20,),
                    FilledButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  PixelArtPracticeScreen())),
                    child: Text("Practice", style: TextStyle(fontSize: 30),)),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}