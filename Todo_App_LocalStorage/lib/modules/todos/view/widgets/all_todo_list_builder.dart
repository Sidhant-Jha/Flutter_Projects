import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_model.dart';
import 'package:todo_app_localstorage/modules/todos/view/todo_view_screen.dart';
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

      return Selector<TodoViewModel, Map<String, dynamic>>(
        selector: (context, viewModel) => {
          'todos': viewModel.todos,
          'isLoadingMore': viewModel.isLoadingMore,
        },
        builder: (context, data, child)
        {
          final todos = data['todos'] as List<TodoModel>;
          final isLoadingMore = data['isLoadingMore'] as bool;
              return Column(
            children: [
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(25)
                ),
                width: 350,
                child: TextField(
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Search task",
                    border: InputBorder.none,
                    
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.extentAfter == 0) {
                      log('reached at the end');
                      context.read<TodoViewModel>().fetchMoreTodos();
                    }
                    return false;
                  },
                  child: ListView.builder(
                    itemCount: todos.length,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    itemBuilder: (context, index)
                    {
                      final todo = todos[index];
                      return TodoViewScreen(model: todo);
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
            // },
            
          // );
        },
        
      );
  }
}