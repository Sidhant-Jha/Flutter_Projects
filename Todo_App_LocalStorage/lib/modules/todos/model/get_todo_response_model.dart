import 'package:todo_app_localstorage/modules/todos/model/todo_model.dart';

class GetTodoResponseModel {
  final List<TodoModel> todos;
  final int total;

  GetTodoResponseModel({required this.todos, required this.total});
}