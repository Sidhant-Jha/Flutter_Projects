import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/model/todo_model.dart';
import 'package:todo_app/modules/todo/view/widgets/create_todo_loader_overlay.dart';
import 'package:todo_app/modules/todo/view/widgets/todo_category_builder.dart';
import 'package:todo_app/modules/todo/view/widgets/todo_priority_builder.dart';
import 'package:todo_app/modules/todo/view/widgets/todo_status_builder.dart';
import 'package:todo_app/modules/todo/view_model/todo_view_model.dart';

class UpdateTodo extends StatefulWidget {
  const UpdateTodo({super.key, required this.todo});

  final TodoModel todo;

  @override
  State<UpdateTodo> createState() => _CreateUpdateScreenState();
}

class _CreateUpdateScreenState extends State<UpdateTodo> {
  final updateTitleController = TextEditingController();
  final updateDescriptionController = TextEditingController();
  final updateFormKey = GlobalKey<FormState>();

  @override
  void initState() {
  super.initState();
  updateTitleController.text = widget.todo.title;
  updateDescriptionController.text = widget.todo.description ?? '';
  }

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text('Update Todo'),
          ),
          body: 
          Form(
            key: updateFormKey,
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: updateTitleController,
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
                        controller: updateDescriptionController,
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
                      TodoCategoryBuilder(model: widget.todo,),
                      SizedBox(height: 16,),
                      TodoPriorityBuilder(model: widget.todo,),
                      SizedBox(height: 16,),
                      TodoStatusBuilder(model: widget.todo,),
                      SizedBox(height: 86,),
            
                      FilledButton(
                        onPressed: () {
                          _onUpdateButtonTapEvent(context);
                        },
                         child: const Text("Update")
                      )
            
                    ],
                  ),
                )
              ),
          )
        ),
        CreateTodoLoaderOverlay(string: 'Updating',)
      ],
    );
  }

  void _onUpdateButtonTapEvent(BuildContext context) {
    if(updateFormKey.currentState!.validate())
    {
      context.read<TodoViewModel>().UpdateTodoEvent(
      todo: widget.todo,
      title: updateTitleController.text.trim(),
      description: updateDescriptionController.text.trim().isEmpty ? null : updateDescriptionController.text.trim(),
      onCompleted: (result)
      {
        Navigator.of(context).pop(result);
        Navigator.of(context).pop();
      });
    }
  }

  @override
  void dispose()
  {
    updateTitleController.dispose();
    updateDescriptionController.dispose();
    super.dispose();
  }
}

