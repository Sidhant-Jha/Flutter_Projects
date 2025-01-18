// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

// import 'dart:developer';
// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_category.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_model.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_priority.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_status.dart';
import 'package:todo_app_localstorage/modules/todos/service/todo_local_database_service.dart';

class TodoViewModel extends ChangeNotifier{
  
  TodoCategory category = TodoCategory.personal;
  TodoPriority priority = TodoPriority.low;
  TodoStatus status = TodoStatus.pending;

  final service = TodoLocalDatabaseService();

  bool isLoading = false;
  bool isLoadingMore = false;

  List<TodoModel> todos = [];

  int total = 0;



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
    await fetchAllTodosEvent();
    onCompleted.call(result);
    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchAllTodosEvent() async
  {
    isLoading = true;
    notifyListeners();

    final result = await service.getAllTodos();
    todos = result?.todos ?? [];
    total = result?.total ?? 0;
    
    isLoading = false;
    notifyListeners();
  }

  Future<void> create100Todo() async
  {
    final faker = Faker();
    for(int i = 0; i < 100; i++)
    {
      await service.createTodo(
        TodoModel(title: 'Task ${i + 1} ${faker.lorem.sentence()}',
         category: faker.randomGenerator.boolean() ? TodoCategory.personal : TodoCategory.work,
         priority: faker.randomGenerator.boolean() ? TodoPriority.low : TodoPriority.high,
         status: TodoStatus.pending,
         createdAt: DateTime.now()
          )
      );
    }
    
  }

  Future<void> fetchMoreTodos() async{

    if(isLoadingMore) return;
    if(todos.length >= total) return;
    isLoadingMore = true;
    notifyListeners();

    final result = await service.getAllTodos(
      offset: todos.length,
    );   

    todos = [...todos, ...result?.todos ?? []];
    total = result?.total ?? 0;
    isLoadingMore = false;
    notifyListeners();

    // await service.updateTodo(id, model)


  }

  Future<void> deleteTodoEvent({required TodoModel todo,
  required VoidCallback onCompleted}) async{
    if(todo.id == null) return;

    isLoading = true;
    notifyListeners();

    await service.deleteTodo(todo.id!);

    isLoading = false;
    _removeTodoFromList(todo);
    onCompleted.call();
    notifyListeners();
  }
  
  void _removeTodoFromList(TodoModel todo) {

    todos.remove(todo);
    total = total -1;
    notifyListeners();
  }

  Future<void> UpdateTodoEvent({required String title, required TodoModel todo,  String? description,
  required Function(TodoModel? result) onCompleted}) async {

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
    final result = await service.updateTodo(todo.id!, model);
    await fetchAllTodosEvent();
    onCompleted.call(result);
    isLoading = false;
    notifyListeners();
  }

}