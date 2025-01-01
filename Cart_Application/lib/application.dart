import 'package:cart_application/screens/home_screen.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget
{
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
  
}