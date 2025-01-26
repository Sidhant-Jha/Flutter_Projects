// import 'dart:developer';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_category.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_model.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_parameter_model.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_priority.dart';
import 'package:todo_app_localstorage/modules/todos/service/todo_local_database_service.dart';

class TodoViewModel extends ChangeNotifier{
  
  TodoCategory category = TodoCategory.personal;
  TodoPriority priority = TodoPriority.low;

  final service = TodoLocalDatabaseService();

  bool isLoading = false;
  bool isLoadingMore = false;

  List<TodoModel> todos = [];

  int total = 0;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;


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

  Future<void> createTodoEvent({required TodoParameterModel parameters, 
  required Function(TodoModel?) onCompleted}) async
  {
    final model = TodoModel(
      title: parameters.title,
      description: parameters.description,
      category: category,
      priority: priority,
      dueDate: parameters.dueDate,
      dueTime: parameters.dueTime,
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
  }

  Future<void> deleteTodoEvent({required TodoModel todo}) async{
    if(todo.id == null) return;

    isLoading = true;
    notifyListeners();

    await service.deleteTodo(todo.id!);
    await _removeTodoFromList(todo);

    isLoading = false;
    notifyListeners();
  }
  
  Future<void> _removeTodoFromList(TodoModel todo) async {
    log('ajejejx');
    // todos.remove(todo);
    todos = List.from(todos)..remove(todo);
    total = total -1;
    notifyListeners();
  }

  Future<void> UpdateTodoEvent({required TodoModel todo, required TodoParameterModel parameters,
  required Function(TodoModel? result) onCompleted}) async {

  final model = TodoModel(
      title: parameters.title,
      description: parameters.description,
      category: category,
      priority: priority,
      dueDate: parameters.dueDate,
      dueTime: parameters.dueTime
    );
    isLoading = true;
    notifyListeners();
    final result = await service.updateTodo(todo.id!, model);
    await fetchAllTodosEvent();
    onCompleted.call(result);
    isLoading = false;
    notifyListeners();
  }

  Future<void> toggleStatus({required TodoModel previousModel}) async{
    
    final model = TodoModel(
    
      title: previousModel.title,
      description: previousModel.description,
      category: previousModel.category,
      priority: previousModel.priority,
      status: previousModel.status == true ? false : true,
      dueDate: previousModel.dueDate,
      dueTime: previousModel.dueTime,
      completedDate: !previousModel.status! ? DateFormat("dd-MM-yyyy").format(DateTime.now()) : null,
      completedTime: !previousModel.status! ? DateFormat('hh:mm a').format(DateTime.now()) : null
    );

    await service.updateTodo(previousModel.id!, model);
    await fetchAllTodosEvent();

    notifyListeners();

  }

}