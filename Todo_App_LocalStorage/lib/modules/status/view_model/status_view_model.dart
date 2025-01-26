import 'package:flutter/material.dart';
import 'package:todo_app_localstorage/modules/status/model/status_model.dart';
import 'package:todo_app_localstorage/modules/todos/service/todo_local_database_service.dart';

class StatusViewModel extends ChangeNotifier {
  
  int? allTodos = 0;
  int? completedTodos = 0;
  int? incompletedTodos = 0;

  // bool isInitialized = false;

  final service = TodoLocalDatabaseService();

   List<Status> getTodoStatus() {
    final List<Status> statusData = [
      Status('Completed', completedTodos!),
      Status('Not Completed', incompletedTodos!)
    ];
    notifyListeners();
    return statusData;
  }

  Future<void> countAllTodo() async
  {
    allTodos = await service.totalTodo();
    notifyListeners();
  }

  Future<void> countAllCompletedTodo() async
  {
    completedTodos = await service.completedTodo();
    notifyListeners();
  }

  Future<void> countAllInCompletedTodo() async
  {
    incompletedTodos = allTodos! - (completedTodos!);
    notifyListeners();
  }
}