import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_shared_preference/application.dart';
import 'package:todo_shared_preference/view_model/todo_view_model.dart';

void main()
{
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => TodoViewModel())
  ],
  child: Application()
  ),);
}