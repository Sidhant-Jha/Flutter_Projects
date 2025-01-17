import 'package:todo_app/modules/todo/model/todo_model.dart';

class GetTodoResponseModel {
  final List<TodoModel> todos;
  final int total;

  GetTodoResponseModel({required this.todos, required this.total});
}