import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_localstorage/modules/todos/view/create_todo_screen.dart';
import 'package:todo_app_localstorage/modules/todos/view/widgets/all_todo_list_builder.dart';
import 'package:todo_app_localstorage/modules/todos/view/widgets/create_todo_loader_overlay.dart';
import 'package:todo_app_localstorage/modules/todos/view_model/view_model.dart';

class AllTodoScreen extends StatelessWidget {
  const AllTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text('Todo App'),
            actions: [
              // IconButton(onPressed: () {
              //   context.read<TodoViewModel>().create100Todo();
              // }, icon: Icon(Icons.data_array))
              IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt))
            ],
          ),
          body: const AllTodoListBuilder(),
        
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ChangeNotifierProvider.value(
              value: context.read<TodoViewModel>(),
              child: CreateTodoScreen()))),
             label: Text('Create'),
             icon: Icon(Icons.add),
            ),
        ),
        CreateTodoLoaderOverlay(string: 'Loading',)
      ],
    );
  }
}