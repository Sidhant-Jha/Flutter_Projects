import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/model/todo_model.dart';
import 'package:todo_app/modules/todo/view/dialog/todo_dialog_helper.dart';
import 'package:todo_app/modules/todo/view/update_todo.dart';
import 'package:todo_app/modules/todo/view/widgets/create_todo_loader_overlay.dart';
import 'package:todo_app/modules/todo/view_model/todo_view_model.dart';

class ViewTodoScreen extends StatelessWidget {
  const ViewTodoScreen({super.key, required this.model});

  final TodoModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text("Todo"),
            actions: [
              IconButton(onPressed: () {
                TodoDialogHelper.showDeleteConfirmationDialog(context, () {

                  context.read<TodoViewModel>().deleteTodoEvent(todo: model, onCompleted: () {
                      Navigator.of(context).pop();
                  });

                });
              }, icon: Icon(Icons.delete)),

              IconButton(onPressed: () {  
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ChangeNotifierProvider.value(
                  value: context.read<TodoViewModel>(),
                  child: UpdateTodo(todo: model))));
              }, icon: Icon(Icons.edit))
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.title, style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 16,),
                if(model.description != null)
                  Text(model.description!, style: Theme.of(context).textTheme.bodyMedium,)
              ],
            ),
          ),
        ),
        CreateTodoLoaderOverlay()
      ],
    );
  }
}