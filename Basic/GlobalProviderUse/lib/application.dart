import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:globalprovider/counter_screen.dart';
import 'package:globalprovider/counter_view_model.dart';

class Application extends StatelessWidget
{
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterViewModel(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true
        ),
        home: const CounterScreen(),
      ),
    );
  }
  
}