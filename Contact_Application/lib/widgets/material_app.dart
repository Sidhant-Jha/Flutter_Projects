import 'package:flutter/material.dart';
import 'package:prac_contact/screens/home_screen.dart';
import 'package:prac_contact/views/model_view.dart';
import 'package:provider/provider.dart';

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({super.key});

  @override
  Widget build(BuildContext context) {

    ThemeData themedata = context.watch<ContactViewModel>().themedate;

    return MaterialApp(
      theme: themedata,
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}