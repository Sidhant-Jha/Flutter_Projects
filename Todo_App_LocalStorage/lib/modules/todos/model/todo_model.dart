import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_category.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_priority.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_status.dart';

class TodoModel {

  final int? id;
  final String title;
  final String? description;
  final TodoCategory category;
  final TodoPriority priority;
  // final TodoStatus status;
  final String dueDate;
  final String dueTime;
  final String? completedDate;
  final String? completedTime;

  const TodoModel({
    this.id,
    required this.title,
    this.description,
    required this.category,
    required this.priority,
    // required this.status,
    required this.dueDate,
    required this.dueTime,
    this.completedDate,
    this.completedTime,
  });

  factory TodoModel.fromDatabaseMap(Map<String, dynamic> map)
  {
    //String --> DateTime
    //Database to Model
    return TodoModel(
     id: map['id'] as int,
     title: map['title'] as String,
     description: map['description'] as String?,
     category: mapToTodoCategory(map['category'] as String),
     priority: mapToTodoPriority(map['priority'] as String),
    //  status: mapToTodoStatus(map['status'] as String),
     dueDate: map['dueDate'] as String,
     dueTime: map['dueTime'] as String,
     completedDate: (map['completedDate'] as String?) != null
        ? map['completedDate'] as String
        : null,
     completedTime: (map['completedTime'] as String?) != null
        ? map['completedTime'] as String
        : null,
    );
  } 

  Map<String, dynamic> toDatabaseMap()
  {
    //DateTime --> String
    //Model to Database
    return {
      'title' : title.trim(),
      'description' : description?.trim(),
      'category' : category.name,
      'priority' : priority.name,
      // 'status' : status.name,
      'dueDate' : dueDate,
      'dueTime' : dueTime,
      'completedDate' : completedDate ?? "",
      'completedTime' : completedTime ?? "",
    };
  }

  TodoModel copyWith({ int? id })
  {
    return TodoModel(id: id ?? this.id, title: title, description: description, category: category, priority: priority, dueDate: dueDate, dueTime: dueTime, completedDate:  completedDate, completedTime: completedTime);
  }

}