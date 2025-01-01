import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_shared_preference/model/model.dart';
import 'package:todo_shared_preference/view/todo_item_dialog.dart';



class TodoViewModel extends ChangeNotifier
{
  ThemeData themeData = ThemeData.light();

  List<Todo> list = [];
  List<Todo> mainList = [];
  String currentFilter = "all"; // "all", "completed", "notCompleted"
  final TextEditingController textController = TextEditingController();



  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void toggleTodo(String dueDate, String title, String dueTime)
  {
    Todo mainTodo = mainList.firstWhere((element) =>
      element.dueDate == dueDate &&
      element.title == title &&
      element.dueTime == dueTime);
    mainTodo.isCompleted = !mainTodo.isCompleted;

  Todo tempo = list.firstWhere((element) => element.dueDate == dueDate && element.title == title && element.dueTime == dueTime);
  tempo.isCompleted = mainTodo.isCompleted;

  if (currentFilter == "completed" && !mainTodo.isCompleted) {
    // Remove task if it's unchecked in the "Completed" filter
    list.removeWhere((element) =>
        element.dueDate == dueDate &&
        element.title == title &&
        element.dueTime == dueTime);
  } else if (currentFilter == "notCompleted" && mainTodo.isCompleted) {
    // Remove task if it's checked in the "Not Completed" filter
    list.removeWhere((element) =>
        element.dueDate == dueDate &&
        element.title == title &&
        element.dueTime == dueTime);
  } else if (currentFilter == "all") {
    // In "All" filter, just update the state
    list = List.from(mainList);
  }
  save();
  notifyListeners();
  }

  

  void searchTodo(String query)
  {
    final suggestions = mainList.where((todo)
    {
      final todoTitle = todo.title.toLowerCase();
      final input = query.toLowerCase();
      return todoTitle.contains(input);
    }).toList();
    
    list = suggestions;
    notifyListeners();
  }
  

  void showcompletedDate(String dueDate, String title, String dueTime) {
    Todo tempo = mainList.firstWhere((element) => element.dueDate == dueDate && element.title == title && element.dueTime == dueTime);
    tempo.completedDate = DateFormat("dd-MM-yyyy").format(DateTime.now());
    load();
    notifyListeners();
  }

  void showcompletedTime(String dueDate, String title, String dueTime, BuildContext context) {
    Todo tempo = mainList.firstWhere((element) => element.dueDate == dueDate && element.title == title && element.dueTime == dueTime);
    tempo.completedTime = TimeOfDay.now().format(context);
    load();
    notifyListeners();
  }


  void todosAll()
  {
    currentFilter = "all";
    list = mainList;
    notifyListeners();
  }

  void todosCompleted()
  {
    currentFilter = "completed";
    list = mainList.where((element) => element.isCompleted).toList();
    notifyListeners();
  }

  void todosNotCompleted() {
  currentFilter = "notCompleted";
  list = mainList.where((element) => !element.isCompleted).toList();
  notifyListeners();
  }

  void changeTheme()
  {
    if(themeData.brightness == Brightness.light)
      themeData = ThemeData.dark();
    else
      themeData = ThemeData.light();
    
    notifyListeners();
  }

  TodoViewModel() {
    textController.addListener(() {
      searchTodo(textController.text);
    });
    init();
  }

  // @override
  // void dispose() {
  //   textController.dispose();
  //   super.dispose();
  // }

  Future<void> init() async {
    await load();
    list = mainList;
    notifyListeners();
  }

  Future<void> load() async
  {
    final pref = await SharedPreferences.getInstance();
    final todoItem = pref.getString('todos');
    if(todoItem != null)
    {
      final List<dynamic> todoList = jsonDecode(todoItem);
      mainList = todoList.map((element) => Todo.fromMap(element)).toList();
    }
    notifyListeners();
    
  }

  Future<void> save() async
  {
    final pref = await SharedPreferences.getInstance();
    final todoString = jsonEncode(mainList.map((element) => element.toMap()).toList());
    await pref.setString('todos', todoString);
  }

  void addTodo(BuildContext context, String title, String dueDate, String dueTime)
  {
    if(mainList.any((value)=> value.title == title &&
      value.dueDate == dueDate &&
      value.dueTime == dueTime  ))
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Task already exists"), duration: Duration(seconds: 2),));
    }
    else
    {
      final newTodo = Todo(dueDate: dueDate, title: title, dueTime: dueTime);
      mainList.add(newTodo);
      save();
      list = mainList;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Task added"), duration: Duration(seconds: 2),));
    }
    notifyListeners();
    
  }

  void deleteTodo(String dueDate, String title, String dueTime)
  {
    save();
    list.removeWhere((item) =>
      item.dueDate == dueDate &&
      item.title == title &&
      item.dueTime == dueTime);
    mainList.removeWhere((item) =>
        item.dueDate == dueDate &&
        item.title == title &&
        item.dueTime == dueTime);  
    notifyListeners();
  }

  
}