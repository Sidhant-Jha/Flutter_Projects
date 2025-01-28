import 'package:flutter/material.dart';

class DeleteScreen extends StatelessWidget {
  const DeleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),

      // body: ,

      floatingActionButton: FloatingActionButton(onPressed: () {}, child: Icon(Icons.delete),),
    );
  }
}