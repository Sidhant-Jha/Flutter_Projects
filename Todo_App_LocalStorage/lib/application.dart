import 'package:flutter/material.dart';
import 'package:todo_app_localstorage/modules/todos/view/all_todo_provider.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: AllTodoProvider(),
    );
  }
}