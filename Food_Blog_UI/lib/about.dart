// import 'package:food_blog/main.dart';
// import 'main.dart';
// import 'diet.dart';
// import 'receipe.dart';
import 'package:flutter/material.dart';
// import 'package:food_blog/navigator.dart';
import 'drawer.dart';
// void main()
// {
//   return runApp(const MaterialApp(
//     home:AboutScreen()
//   ));
// }

class AboutScreen extends StatelessWidget
{
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: NavigationMenu(),
        drawer: DrawerCreate(),
        appBar: AppBar(
          title: const Text('About Us'),
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