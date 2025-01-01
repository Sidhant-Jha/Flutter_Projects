// import 'package:food_blog/main.dart';
// import 'main.dart';
// import 'about.dart';
// import 'diet.dart';
import 'package:flutter/material.dart';
// import 'package:food_blog/navigator.dart';
import 'drawer.dart';
// void main()
// {
//   return runApp(const MaterialApp(
//     home:ReceipeScreen()
//   ));
// }

class ReceipeScreen extends StatelessWidget
{
  const ReceipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: NavigationMenu(),
        drawer: DrawerCreate(),
        appBar: AppBar(
          title: const Text("Receipe"),
          backgroundColor: const Color.fromARGB(255, 255, 203, 125),
          shape: const RoundedRectangleBorder(),
          elevation: 5,
          shadowColor: Colors.black,
          
        ),
      ),
    );
  }

  
}

class DrawerCreate extends StatelessWidget
{
  const DrawerCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawing();
  }
}