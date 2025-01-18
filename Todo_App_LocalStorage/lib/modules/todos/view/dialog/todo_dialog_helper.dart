import 'package:flutter/material.dart';
import 'package:todo_app_localstorage/modules/todos/view/dialog/delete_todo_confirmation_dialog.dart';

class TodoDialogHelper{

  const TodoDialogHelper._();

  static void showDeleteConfirmationDialog(BuildContext context, VoidCallback onDelete)
  {
    showDialog<bool>(context: context, builder: (context)
    {
      return DeleteTodoConfirmationDialog();
    }).then((shouldDelete)
    {
      if(shouldDelete == true)
      {
        onDelete.call();
      }
    });
  }
}