import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/view/create_todo_screen.dart';
import 'package:todo_app/modules/todo/view_model/todo_view_model.dart';

class AllTodoScreen extends StatelessWidget {
  const AllTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ChangeNotifierProvider.value(
          value: context.read<TodoViewModel>(),
          child: CreateTodoScreen()))),
         label: Text('Create'),
         icon: Icon(Icons.add),
        ),
    );
  }
}