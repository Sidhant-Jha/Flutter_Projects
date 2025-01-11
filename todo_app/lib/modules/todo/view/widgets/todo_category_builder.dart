import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/model/todo_category.dart';
import 'package:todo_app/modules/todo/view/all_todo_provider.dart';
import 'package:todo_app/modules/todo/view_model/todo_view_model.dart';

class TodoCategoryBuilder extends StatelessWidget {
  const TodoCategoryBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCategory = context.watch<TodoViewModel>().category;
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