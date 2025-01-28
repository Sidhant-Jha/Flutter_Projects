import 'dart:developer';

import 'package:todo_app_localstorage/core/database/local_database.dart';
import 'package:todo_app_localstorage/modules/delete/model/delete_todo_model.dart';

class DeleteLocalDatabaseService {

  final _db = LocalDatabase.instance.database;

  Future<void> createDeletedTodo(DeleteTodoModel model) async
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

  


}