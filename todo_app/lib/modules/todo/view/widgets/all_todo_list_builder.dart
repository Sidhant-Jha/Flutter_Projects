import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/model/todo_priority.dart';
import 'package:todo_app/modules/todo/view/view_todo_screen.dart';
import 'package:todo_app/modules/todo/view_model/todo_view_model.dart';

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
                  return ListTile(
                    leading: Icon(Icons.circle, size: 20, color: _getColor(todo.priority),),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => ChangeNotifierProvider.value(
                      value: context.read<TodoViewModel>(),
                      child: ViewTodoScreen(model: todo))));
                    },
                    title: Text(todo.title, style: Theme.of(context).textTheme.titleLarge, maxLines: 2, overflow: TextOverflow.ellipsis,),
                    subtitle: todo.description != null ? Text(todo.description!, maxLines: 3, overflow: TextOverflow.ellipsis,) : null
                  );
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