import 'dart:developer';

import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase();
  late final Database database;
  Future<void> createDatabase() async{
    final databasePath = await  getDatabasesPath();
    String path = '$databasePath/my_database.db';

    database = await openDatabase(path, version: 1, onCreate: (db, version) async
    {
      log('Database created at $path!');
      await db.execute(
        "CREATE TABLE todos (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, description TEXT, category TEXT NOT NULL, priority TEXT NOT NULL, status TEXT DEFAULT 'false', dueDate TEXT NOT NULL, dueTime TEXT NOT NULL, completedDate TEXT, completedTime TEXT)",
      );
      log('Created table todos!');

      await db.execute(
        "CREATE TABLE deletedTodos (title TEXT NOT NULL, dueDate TEXT NOT NULL, dueTime TEXT NOT NULL, completedDate TEXT, completedTime TEXT)",
      );
      log('Created table deletedTodos!');
    },
    onOpen: (db)
    {
      log('Database opened ${db.path}');
    });
  }
}