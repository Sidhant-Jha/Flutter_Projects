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
    //model to Database
    return {
      'title' : model.title.trim(),
      'dueDate' : model.dueDate,
      'dueTime' : model.dueTime,
      'completedDate' : model.completedDate ?? "",
      'completedTime' : model.completedTime ?? "",
    };
  }

  factory DeleteTodoModel.fromDatabaseMap(Map<String, dynamic> map)
  {
    //Database to Model
    return DeleteTodoModel(
     title: map['title'] as String,
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

  
}