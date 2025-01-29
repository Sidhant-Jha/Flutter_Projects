import 'package:todo_app_localstorage/modules/delete/model/delete_todo_model.dart';

class GetTodoResponseModel {
  final List<DeleteTodoModel> deletedTodos;
  final int total;

  const GetTodoResponseModel({required this.deletedTodos, required this.total});
}