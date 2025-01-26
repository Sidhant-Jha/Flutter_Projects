import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_model.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_parameter_model.dart';
import 'package:todo_app_localstorage/modules/todos/view/widgets/create_todo_loader_overlay.dart';
import 'package:todo_app_localstorage/modules/todos/view/widgets/todo_category_builder.dart';
import 'package:todo_app_localstorage/modules/todos/view/widgets/todo_priority_builder.dart';
import 'package:todo_app_localstorage/modules/todos/view_model/view_model.dart';

class TodoUpdateScreen extends StatefulWidget {
  const TodoUpdateScreen({super.key, required this.model});

  final TodoModel model;

  @override
  State<TodoUpdateScreen> createState() => _TodoUpdateScreenState();
}

class _TodoUpdateScreenState extends State<TodoUpdateScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final dueDateController = TextEditingController();
  final dueTimeController = TextEditingController();
  final formKey = GlobalKey<FormState>();


   Future<void> selectDueDate(BuildContext context, DateTime? selectedDate) async
  {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001),
      lastDate: DateTime(2026)
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
    titleController.text = widget.model.title;
    descriptionController.text = widget.model.description ?? '';
    dueDateController.text = widget.model.dueDate;
    dueTimeController.text = widget.model.dueTime;

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
                        maxLength: 50,
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
                      TodoCategoryBuilder(model: widget.model,),
                      SizedBox(height: 16,),
                      TodoPriorityBuilder(model: widget.model,),
                      SizedBox(height: 16,),

                      TextFormField(
                          readOnly: true,
                          onTap: () => selectDueDate(context, selectedDate),
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
                          _onSaveButtonTapEvent(context);
                        },
                         child: Text("Update")
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
      final parameter = TodoParameterModel(title: titleController.text.trim(),
       description: descriptionController.text.trim().isEmpty ? null : descriptionController.text.trim(),
       dueDate: dueDateController.text,
       dueTime: dueTimeController.text,
        );
      context.read<TodoViewModel>().UpdateTodoEvent(
      todo: widget.model,
      parameters: parameter,
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
    dueDateController.dispose();
    dueTimeController.dispose();
    super.dispose();
  }
}
