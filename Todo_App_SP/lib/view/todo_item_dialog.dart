import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_shared_preference/view_model/todo_view_model.dart';

class TodoItemDialog extends StatelessWidget {
  TodoItemDialog({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final textController = TextEditingController();
  final dueDateController = TextEditingController();
  final dueTimeController = TextEditingController();
 
  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final title = textController.text.trim();
      final dueDate = dueDateController.text.trim();
      final dueTime = dueTimeController.text.trim();

      if (title.isNotEmpty && dueDate.isNotEmpty && dueTime.isNotEmpty) {
        context.read<TodoViewModel>().addTodo(context, title, dueDate, dueTime);
        textController.clear();
        dueDateController.clear();
        Navigator.of(context).pop();
      }
    }
  }

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
  Widget build(BuildContext context) {

    final DateTime?  selectedDate = context.read<TodoViewModel>().selectedDate;
    final TimeOfDay? selectedDueTime = context.read<TodoViewModel>().selectedTime;

    return AlertDialog(
      title: Text("Add Todo"),
    
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
        
            const SizedBox(height: 5,),
        
            TextFormField(
              controller: textController,
              validator: (value)
              {
                if(value!.trim().isEmpty)
                {
                  return 'Please Enter Valid Title';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintStyle: TextStyle(
                  height: 2
                ),
                prefixIcon: Icon(Icons.title),
                hintText: "Title",
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    style: BorderStyle.none,
                  ),
                )
              ),
            ),
        
            const SizedBox(height: 10,),
            
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


            const SizedBox(height: 10,),

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
            )
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () {
          Navigator.of(context).pop();
        }, child: Text("Cancel")),
        TextButton(onPressed: ()=> _submitForm(context), child: Text("Add"))
      ],
    );
  }
}