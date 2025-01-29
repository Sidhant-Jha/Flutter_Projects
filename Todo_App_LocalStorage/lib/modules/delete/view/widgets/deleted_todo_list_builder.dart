import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_localstorage/modules/delete/model/delete_todo_model.dart';
import 'package:todo_app_localstorage/modules/delete/view/delete_view_screen.dart';
import 'package:todo_app_localstorage/modules/delete/view_model/delete_view_model.dart';

class DeletedTodoListBuilder extends StatefulWidget {
  const DeletedTodoListBuilder({super.key});

  @override
  State<DeletedTodoListBuilder> createState() => _DeletedTodoListBuilderState();
}

class _DeletedTodoListBuilderState extends State<DeletedTodoListBuilder> {

  @override
  void initState() {
    super.initState();
    if(mounted) {context.read<DeleteViewModel>().fetchAllTodosEvent()}
  }
  @override
  Widget build(BuildContext context) {
    return Selector<DeleteViewModel, Map<String, dynamic>>(
        selector: (context, viewModel) => {
          'todos': viewModel.todos,
          'isLoadingMore': viewModel.isLoadingMore,
        },
        builder: (context, data, child)
        {
          final todos = data['todos'] as List<DeleteTodoModel>;
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
                      context.read<DeleteViewModel>().fetchMoreTodos();
                    }
                    return false;
                  },
                  child: ListView.builder(
                    itemCount: todos.length,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    itemBuilder: (context, index)
                    {
                      final todo = todos[index];
                      return DeleteViewScreen(model: todo);
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