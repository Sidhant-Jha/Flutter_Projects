import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/logic/cubit/counter_cubit.dart';
import 'package:todo_bloc/logic/cubit/counter_state.dart';
import 'package:todo_bloc/presentation/screens/home_screen.dart';
import 'package:todo_bloc/presentation/screens/second_screen.dart';
import 'package:todo_bloc/presentation/screens/third_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => BlocProvider.value(
          value: _counterCubit,
          child: HomeScreen(title: "HomeScreen", color: Colors.blueAccent),
          ),

        '/second': (context) => BlocProvider.value(
          value: _counterCubit,
          child: SecondScreen(title: "SecondScreen", color: Colors.orange),
          ),

        '/third': (context) => BlocProvider.value(
          value: _counterCubit,
          child: ThirdScreen(title: "ThirdScreen", color: Colors.pink),
          ),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }

  // @override
  // void dispose()
  // {
  //   _counterCubit.close();
  //   super.dispose();
  // }
  // don't know how without dispose it is working 
}
