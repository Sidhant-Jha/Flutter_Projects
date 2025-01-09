import 'dart:developer';

import 'package:todo_app/core/database/local_database.dart';
import 'package:todo_app/modules/todo/model/todo_model.dart';

class TodoLocalDatabaseService {
  final _db = LocalDatabase.instance.database;

  Future<TodoModel?> createTodo(TodoModel model) async
  {
    try{
      final id = await _db.insert('todos', model.toDatabaseMap());
      log('Created todo id : $id');
      return model.copyWith(id: id);
    }
    catch(e, s)
    {
      log('createTodo', error: e, stackTrace: s, name: '$runtimeType');
      return null;
    }
  }
}