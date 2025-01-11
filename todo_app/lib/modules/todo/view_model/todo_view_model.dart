import 'package:flutter/material.dart';
import 'package:todo_app/modules/todo/model/todo_category.dart';
import 'package:todo_app/modules/todo/model/todo_priority.dart';
import 'package:todo_app/modules/todo/model/todo_status.dart';

class TodoViewModel extends ChangeNotifier{
  
  TodoCategory category = TodoCategory.personal;
  TodoPriority priority = TodoPriority.low;
  TodoStatus status = TodoStatus.pending;



  void changeTodoCategoryEvent(TodoCategory category)
  {
    this.category = category;
    notifyListeners();
  }

  void changeTodoPriorityEvent(TodoPriority priority)
  {
    this.priority = priority;
    notifyListeners();
  }

  void changeTodoStatusEvent(TodoStatus status)
  {
    this.status = status;
    notifyListeners();
  }


}