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
  final TodoStatus status;
  final DateTime dueDate;
  final DateTime dueTime;
  final DateTime? completedDate;
  final DateTime? completedTime;

  const TodoModel({
    this.id,
    required this.title,
    this.description,
    required this.category,
    required this.priority,
    required this.status,
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
     status: mapToTodoStatus(map['status'] as String),
     dueDate: DateFormat('dd-MM-yyyy').parse(map['dueDate'] as String),
     dueTime: DateFormat("HH:mm").parse(map['dueTime'] as String),
     completedDate: (map['completedDate'] as String?) != null
        ? DateFormat('dd-MM-yyyy').parse(map['completedDate'] as String)
        : null,
     completedTime: (map['completedTime'] as String?) != null
        ? DateFormat("HH:mm").parse(map['completedTime'] as String)
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
      'status' : status.name,
      'dueDate' : DateFormat('dd-MM-yyyy').format(dueDate),
      'dueTime' : DateFormat("HH:mm").format(dueTime),
      'completedDate' : DateFormat('dd-MM-yyyy').format(completedDate!),
      'completedTime' : DateFormat("HH:mm").format(completedTime!),
    };
  }

  TodoModel copyWith({ int? id })
  {
    return TodoModel(id: id ?? this.id, title: title, description: description, category: category, priority: priority, status: status, dueDate: dueDate, dueTime: dueTime, completedDate:  completedDate, completedTime: completedTime);
  }

}