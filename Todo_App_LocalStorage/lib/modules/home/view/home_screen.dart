import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:todo_app_localstorage/modules/home/view/widgets/home_navigation_bar.dart';
import 'package:todo_app_localstorage/modules/home/view/widgets/home_screen_body.dart';
// import 'package:todo_app_localstorage/modules/home/view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Todo App"),
      // ),
      bottomNavigationBar: HomeNavigationBar(),
      body: HomeScreenBody(),
    );
  }
}

