import 'package:flutter/material.dart';
import 'package:prac_contact/screens/home_screen.dart';
import 'package:prac_contact/views/model_view.dart';
import 'package:prac_contact/widgets/material_app.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget
{
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(
        create: (context) => ContactViewModel()
        )],
      child: MaterialAppWidget()
      );
  }
  
}