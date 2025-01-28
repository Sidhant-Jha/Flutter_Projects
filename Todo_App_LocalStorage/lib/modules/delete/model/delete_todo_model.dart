class DeleteTodoModel {

  final String title;
  final String dueDate;
  final String dueTime;
  final String? completedDate;
  final String? completedTime;

  const DeleteTodoModel({required this.title,
   required this.dueDate,
   required this.dueTime,
   this.completedDate,
   this.completedTime,
  });


  Map<String, dynamic> toDatabaseMap(DeleteTodoModel model)
  {
    return {
      'title' : model.title.trim(),
      'dueDate' : model.dueDate,
      'dueTime' : model.dueTime,
      'completedDate' : model.completedDate ?? "",
      'completedTime' : model.completedTime ?? "",
    };
  }







}