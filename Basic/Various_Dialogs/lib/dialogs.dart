import 'package:flutter/material.dart';

class Dialogs extends StatelessWidget {
  const Dialogs({super.key});


  void SnakeBar(BuildContext context)
  {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("This is a SnakeBar"),
      duration: Duration(seconds: 1),
      action: SnackBarAction(label: "RETRY", onPressed: () {}),
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Different Dialogs"),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () => SnakeBar(context),
                child: Text("Show Snakebar")
              ),
            ],
          ),
        ),
      );
  }
}