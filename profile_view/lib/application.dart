import 'package:flutter/material.dart';
import 'package:profile_view/view/home_screen.dart';
import 'package:profile_view/view_model/user_provider.dart';
import 'package:provider/provider.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        )
      ],
      child: HomeScreen(),
    );
  }
}