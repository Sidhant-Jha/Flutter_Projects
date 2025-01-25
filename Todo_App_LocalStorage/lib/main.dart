import 'package:flutter/material.dart';
import 'package:todo_app_localstorage/application.dart';
import 'package:todo_app_localstorage/core/database/local_database.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDatabase.instance.createDatabase();
  runApp(const Application());
}