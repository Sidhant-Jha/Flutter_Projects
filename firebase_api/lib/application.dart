import 'package:firebase_api/modules/auth/view/auth_guard.dart';
import 'package:firebase_api/modules/auth/view/auth_screen.dart';
import 'package:firebase_api/modules/auth/view_model/auth_view_model.dart';
import 'package:firebase_api/modules/home/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (context) => AuthViewModel()),

        ChangeNotifierProvider(
        create: (context) => HomeViewModel())
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green
          ),
          useMaterial3: true 
        ),
        home: AuthGuard(),
      ),
    );
  }
}