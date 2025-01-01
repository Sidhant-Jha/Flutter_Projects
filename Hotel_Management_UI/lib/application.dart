import 'package:flutter/material.dart';
import 'package:hotel_ui/screens/burger_screen.dart';
// import 'package:hotel_ui/screens/burger_screen.dart';
import 'package:hotel_ui/screens/home_screen.dart';
import 'package:hotel_ui/screens/list_view.dart';


class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const ListViews()
    );
  }
}