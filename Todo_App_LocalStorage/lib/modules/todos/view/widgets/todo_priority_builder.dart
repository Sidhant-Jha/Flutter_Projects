import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_model.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_priority.dart';
import 'package:todo_app_localstorage/modules/todos/view_model/view_model.dart';

class TodoPriorityBuilder extends StatefulWidget {
  const TodoPriorityBuilder({super.key, this.model});

  final TodoModel? model;

  @override
  State<TodoPriorityBuilder> createState() => _TodoPriorityBuilderState();
}

class _TodoPriorityBuilderState extends State<TodoPriorityBuilder> {

  @override
  void initState() {
    super.initState();
    if(widget.model != null)
    {
      context.read<TodoViewModel>().priority = widget.model!.priority;
    }
    else
    {
      context.read<TodoViewModel>().priority = TodoPriority.low;
    }
  }
  @override
  Widget build(BuildContext context) {
    final selectedPriority = context.watch<TodoViewModel>().priority;
    // log('${selectedPriority}');
    return 
        Row(
          children: [
            Text("Priority",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Spacer(),
            ...TodoPriority.values.map((priority)
            {
              return
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputChip(
                      label: Text(priority.name),
                      selected: selectedPriority == priority,
                      onSelected: (value) 
                      {
                        _onSelectedEvent(value, context, priority);
                      }
                    ),
                  );
            }).toList()
          ]
        );
  }

  void _onSelectedEvent(bool value, BuildContext context, TodoPriority priority) {
    if(value)
    {
      context.read<TodoViewModel>().changeTodoPriorityEvent(priority);
    }
  }
}