import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:todo_app_localstorage/core/database/local_database.dart';
import 'package:todo_app_localstorage/modules/delete/model/delete_todo_model.dart';
import 'package:todo_app_localstorage/modules/delete/model/get_todo_response_model.dart';

class DeleteLocalDatabaseService {
  final _db = LocalDatabase.instance.database;

  Future<void> createTodo(DeleteTodoModel model) async
  {
    try{
      final result = await _db.insert('deletedTodos', model.toDatabaseMap(model));
      log("Delete Todo ${result} created");
    }
    catch(e, s)
    {
      log('createDeletedTodo', error : e, stackTrace: s, name: '$runtimeType');
    }
  }

  Future<GetTodoResponseModel?> getAllTodos({int limit = 14, int offset = 0}) async {
    try{
      final result = await  _db.query
      ('deletedTodos',
      limit: limit,
      offset: offset,
      );
      final total = Sqflite.firstIntValue(
        await _db.rawQuery(
          'SELECT COUNT(*) FROM todos',
        ),
      );

    final todos = result.map((map) {
        return DeleteTodoModel.fromDatabaseMap(map);
      }).toList();

    return GetTodoResponseModel(deletedTodos: todos, total: total ?? 0);
    }
    catch(e, s)
    {
      log('getAllTodo', error: e, stackTrace: s, name: '$runtimeType');
      return null;
    }
  }

  Future<void> deleteTodo(int id) async
  {
    try{
       final result = await _db.delete("deletedTodos", where: "id = ?", whereArgs: [id]);
       log('${result} deleted from db');
    }
    catch(e, s)
    {
      log('deleteTodo', error: e, stackTrace: s, name: '$runtimeType');
    }
  }

}