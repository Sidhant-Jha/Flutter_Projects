import 'package:flutter/material.dart';
import 'package:todo_app_localstorage/modules/delete/view/delete_screen.dart';
import 'package:todo_app_localstorage/modules/home/module/bottom_nav_model.dart';
import 'package:todo_app_localstorage/modules/status/view/status_screen.dart';
import 'package:todo_app_localstorage/modules/todos/view/all_todo_provider.dart';

class HomeViewModel extends ChangeNotifier
{
  final navigationItems = [
    BottomNavModel(icon: Icon(Icons.list_alt_outlined), name: "All Todos", page: AllTodoProvider()),
    BottomNavModel(icon: Icon(Icons.autorenew), name: "Status", page: StatusScreen()),
    BottomNavModel(icon: Icon(Icons.delete), name: "Delete", page: DeleteScreen()),
  ];

  int selectedIndex = 0;

  void indexChangeEvent(int index)
  {
    selectedIndex = index;
    notifyListeners();
  }

  Widget get selectedPage => navigationItems[selectedIndex].page;
  
}