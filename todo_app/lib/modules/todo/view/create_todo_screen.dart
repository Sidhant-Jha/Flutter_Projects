import 'package:flutter/material.dart';
import 'package:todo_app/modules/todo/view/widgets/todo_category_builder.dart';
import 'package:todo_app/modules/todo/view/widgets/todo_priority_builder.dart';
import 'package:todo_app/modules/todo/view/widgets/todo_status_builder.dart';

class CreateTodoScreen extends StatelessWidget {
  const CreateTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Todo'),
      ),
      body: 
      SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Title",
                    prefixIcon: Icon(Icons.title),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                    hintText: "Enter Title"
                  ),
                  maxLength: 20,
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                    prefixIcon: Icon(Icons.text_snippet_sharp),
                    hintText: "Enter Description"
                  ),
                  maxLines: 4,
                  maxLength: 100,
                ),
                SizedBox(height: 16,),
                TodoCategoryBuilder(),
                SizedBox(height: 16,),
                TodoPriorityBuilder(),
                SizedBox(height: 16,),
                TodoStatusBuilder(),
                SizedBox(height: 86,),

                FilledButton(
                  onPressed: () {},
                   child: Text("Save")
                )

              ],
            ),
          )
        )
    );
  }
}