import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_priority.dart';
import 'package:todo_app_localstorage/modules/todos/view/todo_view_screen.dart';
import 'package:todo_app_localstorage/modules/todos/view/view_todo_screen.dart';
import 'package:todo_app_localstorage/modules/todos/view_model/view_model.dart';

class AllTodoListBuilder extends StatefulWidget {
  const AllTodoListBuilder({super.key});

  @override
  State<AllTodoListBuilder> createState() => _AllTodoListBuilderState();
}

class _AllTodoListBuilderState extends State<AllTodoListBuilder> {

  @override
  void initState()
  {
    super.initState();
    Future.microtask(()
    {
      if(mounted) context.read<TodoViewModel>().fetchAllTodosEvent();
    });
  }

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<TodoViewModel>().todos;
    final isLoadingMore = context.watch<TodoViewModel>().isLoadingMore;

      return Column(
        children: [
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification.metrics.extentAfter == 0) {
                  log('reached at the end');
                  context.read<TodoViewModel>().fetchMoreTodos();
                }
                return false;
              },
              child: ListView.separated(
                itemCount: todos.length,
                padding: EdgeInsets.symmetric(vertical: 16),
                itemBuilder: (context, index)
                {
                  final todo = todos[index];
                  log('${todo.description}');
                  return TodoViewScreen(model: todo);
                },
                separatorBuilder: (context, index)
                {
                  return const Divider(thickness: 1);
                },
              ),
            ),
          ),
          if(isLoadingMore)
            const SizedBox(
              height: 24,
              width: 24,
              child: Center(
                child:  CircularProgressIndicator(),
              ),
            )
        ],
      );
  }
  
 Color _getColor(TodoPriority priority) {
  switch(priority)
  {
    case TodoPriority.low:
      return Colors.greenAccent;
    case TodoPriority.medium:
      return Colors.yellowAccent;
    case TodoPriority.high:
      return Colors.redAccent;
  }
 }
}