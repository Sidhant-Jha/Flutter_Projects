import 'package:flutter/material.dart';
import 'package:todo_app_localstorage/modules/delete/view/widgets/deleted_todo_list_builder.dart';

class DeleteScreen extends StatelessWidget {
  const DeleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),

      body: DeletedTodoListBuilder(),

      floatingActionButton: FloatingActionButton(onPressed: () {}, child: Icon(Icons.delete),),
    );
  }
}