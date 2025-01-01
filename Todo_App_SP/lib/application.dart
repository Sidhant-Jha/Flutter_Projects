import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_shared_preference/view/todo.dart';
import 'package:todo_shared_preference/view_model/todo_view_model.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {

    ThemeData themeData = context.watch<TodoViewModel>().themeData;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: TodoApp()
    );
  }
}