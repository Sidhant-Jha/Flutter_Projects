import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_model.dart';
import 'package:todo_app_localstorage/modules/todos/view/widgets/create_todo_loader_overlay.dart';
import 'package:todo_app_localstorage/modules/todos/view/widgets/todo_category_builder.dart';
import 'package:todo_app_localstorage/modules/todos/view/widgets/todo_priority_builder.dart';
// import 'package:todo_app_localstorage/modules/todos/view/widgets/todo_status_builder.dart';
import 'package:todo_app_localstorage/modules/todos/view_model/view_model.dart';

class UpdateTodo extends StatefulWidget {
  const UpdateTodo({super.key, required this.todo});

  final TodoModel todo;

  @override
  State<UpdateTodo> createState() => _CreateUpdateScreenState();
}

class _CreateUpdateScreenState extends State<UpdateTodo> {
  final updateTitleController = TextEditingController();
  final updateDescriptionController = TextEditingController();
  final dueDateController = TextEditingController();
  final dueTimeController = TextEditingController();
  final formKey = GlobalKey<FormState>();


   Future<void> selectDueDate(BuildContext context, DateTime? selectedDate) async
  {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001),
      lastDate: DateTime(2025)
    );

    if(pickedDate != null)
    {
      selectedDate = pickedDate;
      dueDateController.text = DateFormat("dd-MM-yyyy").format(pickedDate);
    }
  }

  Future<void> selectDueTime(BuildContext context, TimeOfDay? selectedTime) async
  {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now()
    );

    if(pickedTime != null)
    {
      selectedTime = pickedTime;
      dueTimeController.text = pickedTime.format(context);
    }
  }

  @override
  void initState() {
  super.initState();
  updateTitleController.text = widget.todo.title;
  updateDescriptionController.text = widget.todo.description ?? '';
  }

  @override
  Widget build(BuildContext context){
    final DateTime?  selectedDate = context.read<TodoViewModel>().selectedDate;
    final TimeOfDay? selectedDueTime = context.read<TodoViewModel>().selectedTime;

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text('Update Todo'),
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
                      
                        TextFormField(
                          onTap: () => selectDueDate(context, selectedDate),
                          readOnly: true,
                          controller: dueDateController,
                          validator: (value)
                          {
                            if(value!.trim().isEmpty)
                            {
                              return 'Please Select Due Date';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(
                              height: 2
                            ),
                            prefixIcon: Icon(Icons.calendar_month),
                            hintText: "Due Date",
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.none,
                              ),
                            )
                          ),
                        ),

                      SizedBox(height: 16,),


                       TextFormField(
                          readOnly: true,
                          onTap: ()=> selectDueTime(context, selectedDueTime),
                          controller: dueTimeController,
                          validator: (value)
                          {
                            if(value!.trim().isEmpty)
                            {
                              return "Please Select Due Time";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(
                              height: 2
                            ),
                            prefixIcon: Icon(Icons.access_time),
                            hintText: "Due Time",
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                style: BorderStyle.none
                              )
                            )
                          ),
                        ),

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
    if(formKey.currentState!.validate())
    {
      context.read<TodoViewModel>().UpdateTodoEvent(
      dueDate: dueDateController.text,
      dueTime: dueTimeController.text,
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
