import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class NameModelView extends ChangeNotifier
{
  final textcontroller =  TextEditingController();

  void update(String name)
  {
    textcontroller.text = name;
    notifyListeners();
  }

}