import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_category.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_model.dart';
import 'package:todo_app_localstorage/modules/todos/view_model/view_model.dart';

class TodoCategoryBuilder extends StatefulWidget {
  const TodoCategoryBuilder({super.key, this.model});

  final TodoModel? model;

  @override
  State<TodoCategoryBuilder> createState() => _TodoCategoryBuilderState();
}

class _TodoCategoryBuilderState extends State<TodoCategoryBuilder> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.model != null)
    {
      context.read<TodoViewModel>().category = widget.model!.category;
    }
    else
    {
      context.read<TodoViewModel>().category = TodoCategory.personal;
    }
  }
  @override
  Widget build(BuildContext context) {
    final selectedCategory = context.watch<TodoViewModel>().category;
    // final selectedCategory = context.watch<TodoViewModel>().category;
    log('${selectedCategory}');
    return 
        Row(
          children: [
            Text("Category",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Spacer(),
            ...TodoCategory.values.map((category)
            {
              return
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputChip(
                      label: Text(category.name),
                      selected: selectedCategory == category,
                      onSelected: (value) 
                      {
                        _onSelectedEvent(value, context, category);
                      }
                    ),
                  );
            }).toList()
          ]
        );
  }

  void _onSelectedEvent(bool value, BuildContext context, TodoCategory category) {
    if(value)
    {
      context.read<TodoViewModel>().changeTodoCategoryEvent(category);
    }
  }
}