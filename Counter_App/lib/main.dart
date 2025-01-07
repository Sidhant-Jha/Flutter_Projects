import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/logic/cubit/counter_cubit.dart';
import 'package:todo_bloc/logic/cubit/counter_state.dart';
import 'package:todo_bloc/logic/cubit/internet_cubit.dart';
import 'package:todo_bloc/presentation/route/app_route.dart';
// import 'package:todo_bloc/presentation/router/app_router.dart';
import 'package:todo_bloc/presentation/screens/home_screen.dart';
import 'package:todo_bloc/presentation/screens/second_screen.dart';
import 'package:todo_bloc/presentation/screens/third_screen.dart';

void main() {
  runApp(MyApp(appRouter: AppRoute(), connectivity: Connectivity(),));
}

class MyApp extends StatelessWidget {
  final AppRoute appRouter;
  final Connectivity connectivity;
  MyApp({super.key, required this.appRouter, required this.connectivity});


  // final AppRoute _appRoute = AppRoute();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider<InternetCubit>(create: (context) => InternetCubit(connectivity: connectivity)),

        BlocProvider<CounterCubit>(create: (context) => CounterCubit())
      ],
    
    child: MaterialApp(
        onGenerateRoute: appRouter.onGenerateRoute,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true
        ),
        // home: HomeScreen(title: "HomeScreen", color: Colors.blueAccent),
      ),
    );
  }
}
