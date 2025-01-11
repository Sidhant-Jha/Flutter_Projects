import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/model/todo_category.dart';
import 'package:todo_app/modules/todo/model/todo_priority.dart';
import 'package:todo_app/modules/todo/view/all_todo_provider.dart';
import 'package:todo_app/modules/todo/view_model/todo_view_model.dart';

class TodoPriorityBuilder extends StatelessWidget {
  const TodoPriorityBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedPriority = context.watch<TodoViewModel>().priority;
    log('${selectedPriority}');
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