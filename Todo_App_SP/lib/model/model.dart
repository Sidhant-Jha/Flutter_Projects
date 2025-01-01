class Todo{
  final String dueDate;
  final String dueTime;
  final String title;
  String completedDate;
  String completedTime;
  bool isCompleted;
  

  Todo({required this.dueDate, required this.dueTime, required this.title, this.completedDate = "", this.completedTime = "",  this.isCompleted = false});

  factory Todo.fromMap(Map<String, dynamic> map)
  {
    return Todo(dueDate: map["dueDate"], dueTime: map["dueTime"], title: map["title"], completedDate: map["completedDate"], completedTime: map["completedTime"], isCompleted: map["isCompleted"],);
  }

  Map<String, dynamic> toMap()
  {
    return {
      "dueDate" : dueDate,
      "dueTime" : dueTime,
      "title" : title,
      "completedDate" : completedDate,
      "completedTime" : completedTime,
      "isCompleted" : isCompleted
    };
  }
}