import 'package:firebase_api/core/env_service.dart';
import 'package:firebase_api/modules/auth/view_model/auth_view_model.dart';
import 'package:firebase_api/modules/home/view/widgets/home_navigation_bar.dart';
import 'package:firebase_api/modules/home/view/widgets/home_screen_body.dart';
import 'package:firebase_api/modules/home/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HomeNavigationBar(),
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          PopupMenuButton(itemBuilder: (context)
          {
            return [
              PopupMenuItem(child: Text("Logout"), onTap: () 
              {
                context.read<AuthViewModel>().logoutClickEvent();
              },)
            ];
          })
        ],
      ),
      body: HomeScreenBody()
    );
  }
}
