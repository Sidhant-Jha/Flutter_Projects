import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_localstorage/modules/home/view/home_screen.dart';
import 'package:todo_app_localstorage/modules/home/view_model/home_view_model.dart';
import 'package:todo_app_localstorage/modules/status/view_model/status_view_model.dart';
// import 'package:todo_app_localstorage/modules/todos/view/all_todo_provider.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => StatusViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        // home: AllTodoProvider(),
        home: HomeScreen()
      ),
    );
  }
}