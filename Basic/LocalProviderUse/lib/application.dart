import 'package:flutter/material.dart';
import 'package:localprovideruse/counter_page.dart';

class Application extends StatelessWidget
{
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green
        )
      ),
      home: const CounterPage()
    );
  }
  
}