import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main()
{
  runApp(MaterialApp(
    home: DatePickerStateful(),
  ));
}



class DatePickerStateful extends StatefulWidget {
  const DatePickerStateful({super.key});

  @override
  State<DatePickerStateful> createState() => _DatePickerStatefulState();
}

class _DatePickerStatefulState extends State<DatePickerStateful> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> selectDate(BuildContext context) async
  {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2028)
    );

    if(pickedDate != null)
    {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> selectTime(BuildContext context) async
  {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
       initialTime: TimeOfDay.now()
      );

      if(pickedTime != null)
      {
        setState(() {
          selectedTime = pickedTime;
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date and Time Picker Stateful"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10,),
        
            Text(selectedDate == null 
            ? "No Date Selected" 
            : DateFormat("dd-MM-yyy").format(selectedDate!)),
        
            SizedBox(height: 10,),
        
            ElevatedButton(onPressed: () => selectDate(context),
             child: Text("Select Date"),
            ),

            SizedBox(height: 10,),

            Text(selectedTime == null
            ? "No Time Selected"
            : selectedTime!.format(context)),

            SizedBox(height: 10,),

            ElevatedButton(onPressed: () => selectTime(context),
             child: Text("Select Time"))


          ],
        ),
      ),
    );
  }
}