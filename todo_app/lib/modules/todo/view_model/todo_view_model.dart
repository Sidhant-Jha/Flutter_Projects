// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:todo_app/modules/todo/model/todo_category.dart';
import 'package:todo_app/modules/todo/model/todo_model.dart';
import 'package:todo_app/modules/todo/model/todo_priority.dart';
import 'package:todo_app/modules/todo/model/todo_status.dart';
import 'package:todo_app/modules/todo/service/todo_local_database_service.dart';

class TodoViewModel extends ChangeNotifier{
  
  TodoCategory category = TodoCategory.personal;
  TodoPriority priority = TodoPriority.low;
  TodoStatus status = TodoStatus.pending;

  final service = TodoLocalDatabaseService();

  bool isLoading = false;

  List<TodoModel> todos = [];


  void changeTodoCategoryEvent(TodoCategory category)
  {
    this.category = category;
    notifyListeners();
  }

  void changeTodoPriorityEvent(TodoPriority priority)
  {
    this.priority = priority;
    notifyListeners();
  }

  void changeTodoStatusEvent(TodoStatus status)
  {
    this.status = status;
    notifyListeners();
  }

  Future<void> createTodoEvent({required String title, String? description,
  required Function(TodoModel? result) onCompleted}) async
  {
    final model = TodoModel(
      title: title,
      description: description,
      category: category,
      priority: priority,
      status: status,
      createdAt: DateTime.now(),
    );
    isLoading = true;
    notifyListeners();
    final result = await service.createTodo(model);
    onCompleted.call(result);
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchAllTodosEvent() async
  {
    
  }

}