import 'package:flutter/material.dart';

class GlobalPixelProvider extends ChangeNotifier
{
  ThemeData themeData = ThemeData.dark();


  void changeTheme()
  {
    if(themeData.brightness == Brightness.dark)
      themeData = ThemeData.light();
    else
      themeData = ThemeData.dark();

    notifyListeners();
  }
}