import 'package:flutter/material.dart';
import 'package:todo_app_localstorage/modules/delete/model/delete_todo_model.dart';
import 'package:todo_app_localstorage/modules/todos/service/todo_local_database_service.dart';

class DeleteViewModel extends ChangeNotifier{

  bool isLoading = false;
  bool isLoadingMore = false;
  List<DeleteTodoModel> todos = [];

  final service = TodoLocalDatabaseService();


  int total = 0;

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

}