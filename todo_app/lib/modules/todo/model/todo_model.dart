import 'package:todo_app/modules/todo/model/todo_category.dart';
import 'package:todo_app/modules/todo/model/todo_priority.dart';
import 'package:todo_app/modules/todo/model/todo_status.dart';

class TodoModel {
  final int id;
  final String title;
  final String? description;
  final TodoCategory category;
  final TodoPriority priority;
  final TodoStatus status;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  const TodoModel({
    required this.id,
    required this.title,
    this.description,
    required this.category,
    required this.priority,
    required this.status,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  // Map
}