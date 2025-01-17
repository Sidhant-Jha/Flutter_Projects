import 'dart:async';
import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:todo_app/core/database/local_database.dart';
import 'package:todo_app/modules/todo/model/get_todo_response_model.dart';
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

  Future<GetTodoResponseModel?> getAllTodos({int limit = 14, int offset = 0}) async{
    
    try{

    final result = await  _db.query('todos',
    limit: limit,
    offset: offset,
    orderBy: 'id DESC'
    );

    final total = Sqflite.firstIntValue(
        await _db.rawQuery(
          'SELECT COUNT(*) FROM todos',
        ),
      );

    final todos = result.map((map) {
        return TodoModel.fromDatabaseMap(map);
      }).toList();

    await Future.delayed(Duration(seconds: 2));

    return GetTodoResponseModel(todos: todos, total: total ?? 0);
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