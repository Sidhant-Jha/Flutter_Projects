import 'package:flutter/material.dart';
import 'package:localprovideruse/counter_screen.dart';
import 'package:localprovideruse/counter_view_model.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterViewModel(),
      child: const CounterScreen(),
    );
  }
}