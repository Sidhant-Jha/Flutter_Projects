import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/view/widgets/create_todo_loader_overlay.dart';
import 'package:todo_app/modules/todo/view/widgets/todo_category_builder.dart';
import 'package:todo_app/modules/todo/view/widgets/todo_priority_builder.dart';
import 'package:todo_app/modules/todo/view/widgets/todo_status_builder.dart';
import 'package:todo_app/modules/todo/view_model/todo_view_model.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text('Create Todo'),
          ),
          body: 
          Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: titleController,
                        validator: (input)
                        {
                          if(input == null) return "Title is required";
                          if(input.trim().length <= 5) return "Minimum 5 characters are required";
                          if(input.trim().isEmpty) return "Title is required";
                          return null;                     
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      TextFormField(
                        controller: descriptionController,
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
                        onPressed: () {
                          _onSaveButtonTapEvent(context);
                        },
                         child: Text("Save")
                      )
            
                    ],
                  ),
                )
              ),
          )
        ),
        CreateTodoLoaderOverlay(string: "Saving",)
      ],
    );
  }

  void _onSaveButtonTapEvent(BuildContext context) {
    if(formKey.currentState?.validate() == true)
    {
      context.read<TodoViewModel>().createTodoEvent(
      title: titleController.text.trim(),
      description: descriptionController.text.trim().isEmpty ? null : descriptionController.text.trim(),
      onCompleted: (result)
      {
        Navigator.of(context).pop(result);
      });
    }
  }

  @override
  void dispose()
  {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}

