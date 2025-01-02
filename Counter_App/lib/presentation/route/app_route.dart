import 'package:flutter/material.dart';
import 'package:todo_bloc/presentation/screens/second_screen.dart';
import 'package:todo_bloc/presentation/screens/third_screen.dart';

class AppRoute{
  Route onGenerateRoute(RouteSettings routeSettings)
  { 

    switch (routeSettings.name) {
      case '/second':
        return MaterialPageRoute(
          builder: (context) => SecondScreen(
            title: "SecondPage",
            color: Colors.orange,
          ),
        );

      
      case '/third':
        return MaterialPageRoute(
          builder: (context) => ThirdScreen(
            title: "ThirdPage",
            color: Colors.pink,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}