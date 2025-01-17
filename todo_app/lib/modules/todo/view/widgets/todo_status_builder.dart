import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/model/todo_category.dart';
import 'package:todo_app/modules/todo/model/todo_model.dart';
import 'package:todo_app/modules/todo/model/todo_priority.dart';
import 'package:todo_app/modules/todo/model/todo_status.dart';
import 'package:todo_app/modules/todo/view/all_todo_provider.dart';
import 'package:todo_app/modules/todo/view_model/todo_view_model.dart';

class TodoStatusBuilder extends StatefulWidget {
  const TodoStatusBuilder({super.key, this.model});

  final TodoModel? model;

  @override
  State<TodoStatusBuilder> createState() => _TodoStatusBuilderState();
}

class _TodoStatusBuilderState extends State<TodoStatusBuilder> {

  @override
  void initState() {
    super.initState();
    if(widget.model != null)
    {
      context.read<TodoViewModel>().status = widget.model!.status;
    }
    else
    {
      context.read<TodoViewModel>().status = TodoStatus.pending;
    }
  }
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