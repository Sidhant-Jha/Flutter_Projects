import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_localstorage/modules/todos/view/all_todo_screen.dart';
import 'package:todo_app_localstorage/modules/todos/view_model/view_model.dart';

class AllTodoProvider extends StatelessWidget {
  const AllTodoProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoViewModel(),
      child: AllTodoScreen(),
      );
  }
}