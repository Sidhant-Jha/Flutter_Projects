import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/logic/cubit/counter_cubit.dart';
import 'package:todo_bloc/presentation/screens/home_screen.dart';
import 'package:todo_bloc/presentation/screens/second_screen.dart';
import 'package:todo_bloc/presentation/screens/third_screen.dart';

class AppRoute {
  final CounterCubit _counterCubit = CounterCubit();

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: HomeScreen(
              title: "HomePage",
              color: Colors.blueAccent,
            ),
          ),
        );

      case '/second':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: SecondScreen(
              title: "SecondPage",
              color: Colors.orange,
            ),
          ),
        );

      case '/third':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: ThirdScreen(
              title: "ThirdPage",
              color: Colors.pink,
            ),
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


  // void dispose()
  // {
  //   _counterCubit.close();
  // }
}
