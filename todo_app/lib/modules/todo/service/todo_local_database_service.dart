import 'dart:async';
import 'dart:developer';

import 'package:todo_app/core/database/local_database.dart';
import 'package:todo_app/modules/todo/model/todo_model.dart';

class TodoLocalDatabaseService {
  final _db = LocalDatabase.instance.database;

  Future<TodoModel?> createTodo(TodoModel model) async
  {
    try{
      final id = await _db.insert('todos', model.toDatabaseMap());
      await Future.delayed(Duration(seconds: 3));
      log('Created todo id : $id');
      return model.copyWith(id: id);
    }
    catch(e, s)
    {
      log('createTodo', error: e, stackTrace: s, name: '$runtimeType');
      return null;
    }
  }

  Future<List<TodoModel>?> getAllTodos() async{
    
    try{
    final result = await  _db.query('todos');
    return result.map((map) 
    {
      return TodoModel.fromDatabaseMap(map);
    }).toList();
    }
    catch(e, s)
    {
      log('getAllTodo', error: e, stackTrace: s, name: '$runtimeType');
      return null;
    }

  }

  Future<TodoModel?> updateTodo(int id, TodoModel model) async
  {
    try{
      final result = await _db.update('todos', model.toDatabaseMap(), where: "id = ?", whereArgs: [id]);
      log('Updated $result todo');
      return model;
    }
    catch(e, s)
    {
      log('deleteTodo', error: e, stackTrace: s, name: '$runtimeType');
      return null;
    }
  }

  Future<void> deleteTodo(int id) async
  {
    try{
      final result = await _db.delete("todos", where: "id = ?", whereArgs: [id]);
      log('Delete $result todo');
    }
    catch(e, s)
    {
      log('deleteTodo', error: e, stackTrace: s, name: '$runtimeType');
    }

  }

}