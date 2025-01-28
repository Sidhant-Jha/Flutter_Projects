import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app_localstorage/core/database/local_database.dart';
import 'package:todo_app_localstorage/modules/todos/model/get_todo_response_model.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_model.dart';

class TodoLocalDatabaseService {
  final _db = LocalDatabase.instance.database;


  Future<TodoModel?> createTodo(TodoModel model) async
  {
    try{
      final id = await _db.insert('todos', model.toDatabaseMap());
      return model.copyWith(id: id);
    }
    catch(e, s)
    {
      log('createTodo', error : e, stackTrace: s, name: '$runtimeType');
      return null;
    }
  }

  Future<GetTodoResponseModel?> getAllTodos({int limit = 14, int offset = 0}) async{
    try{
      final result = await  _db.query
      ('todos',
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
      await _db.update('todos', model.toDatabaseMap(), where: "id = ?", whereArgs: [id]);
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
      Future.delayed(Duration(seconds: 2));
       final result = await _db.delete("todos", where: "id = ?", whereArgs: [id]);
       log('${result} deleted from db');
    }
    catch(e, s)
    {
      log('deleteTodo', error: e, stackTrace: s, name: '$runtimeType');
    }
  }

  Future<int?> totalTodo() async
  {
    try
    {
      final result = await Sqflite.firstIntValue(await _db.rawQuery('SELECT COUNT(*) FROM todos'));
      return result;
    }
    catch(e, s)
    {
      log('totalTodo', error: e, stackTrace: s, name: '$runtimeType');
    }
    return null;
  }

  Future<int?> completedTodo() async
  {
    try
    {
      final result = await Sqflite.firstIntValue(await _db.rawQuery('SELECT COUNT(*) FROM todos WHERE status = ?', ['true']));
      return result;
    }
    catch(e, s)
    {
      log('completedTodo', error: e, stackTrace: s, name: '$runtimeType');
    }
    return null;
  }


}