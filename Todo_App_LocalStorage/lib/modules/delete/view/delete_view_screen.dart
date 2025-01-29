import 'package:flutter/material.dart';
import 'package:todo_app_localstorage/modules/delete/model/delete_todo_model.dart';

class DeleteViewScreen extends StatelessWidget {
  const DeleteViewScreen({super.key, required this.model});

  final DeleteTodoModel model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.title),
      subtitle: Column(
        children: [
          Text('Due : ${model.dueDate} at ${model.dueTime}')
        ],
      ),
    );
  }
}