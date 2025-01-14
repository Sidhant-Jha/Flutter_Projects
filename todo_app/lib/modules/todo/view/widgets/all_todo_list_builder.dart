import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/view_model/todo_view_model.dart';

class AllTodoListBuilder extends StatefulWidget {
  const AllTodoListBuilder({super.key});

  @override
  State<AllTodoListBuilder> createState() => _AllTodoListBuilderState();
}

class _AllTodoListBuilderState extends State<AllTodoListBuilder> {


  void initState()
  {
    super.initState();
    Future.microtask(()
    {
      if(mounted) 
      {
        context.read<TodoViewModel>().fetchAllTodosEvent();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
  }
}