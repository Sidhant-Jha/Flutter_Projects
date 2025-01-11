import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/model/todo_category.dart';
import 'package:todo_app/modules/todo/model/todo_priority.dart';
import 'package:todo_app/modules/todo/model/todo_status.dart';
import 'package:todo_app/modules/todo/view/all_todo_provider.dart';
import 'package:todo_app/modules/todo/view_model/todo_view_model.dart';

class TodoStatusBuilder extends StatelessWidget {
  const TodoStatusBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedStatus = context.watch<TodoViewModel>().status;
    log('${selectedStatus}');
    return 
        Row(
          children: [
            Text("Status",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Spacer(),
            ...TodoStatus.values.map((status)
            {
              return
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputChip(
                      label: Text(status.name),
                      selected: selectedStatus == status,
                      onSelected: (value) 
                      {
                        _onSelectedEvent(value, context, status);
                      }
                    ),
                  );
            }).toList()
          ]
        );
  }

  void _onSelectedEvent(bool value, BuildContext context, TodoStatus status) {
    if(value)
    {
      context.read<TodoViewModel>().changeTodoStatusEvent(status);
    }
  }
}