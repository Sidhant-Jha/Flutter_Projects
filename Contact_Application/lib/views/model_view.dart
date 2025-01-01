import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prac_contact/models/contact.dart';
import 'package:prac_contact/widgets/dialog_list.dart';

class ContactViewModel extends ChangeNotifier
{
  List<Contact> contactlist = [];

  DateTime? selectedDate;

  ThemeData themedate = ThemeData.light();

  void changeTheme()
  {
    if(themedate.brightness == Brightness.light)
    {
      themedate = ThemeData.dark();
    }
    else
    {
      themedate = ThemeData.light();
    }
    notifyListeners();
  }


  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  final numberController = TextEditingController();


  Future<void> selectDate(BuildContext context) async
  {
    final DateTime? pickedDate = await showDatePicker(context: context, 
    initialDate: DateTime.now(),
    firstDate: DateTime(1900), 
    lastDate: DateTime(2100)
    );

    if((pickedDate != null) & (selectedDate != pickedDate))
    {
      selectedDate = pickedDate;
    }
    notifyListeners();

  }

  Future<void> showDateDialog(BuildContext context) async
  {
    await selectDate(context);

    // await Future.delayed(Duration(seconds: 1));

    if (selectedDate != null) {
    dobController.text = DateFormat("dd-MM-yyyy").format(selectedDate!).toString();
    }

    // do above part or do below part both works 
    // in above part null assertion operation is use which can cause runtime error if null is assigned 
    // final DateTime date = selectedDate ?? DateTime.now();
    // dobController.text = DateFormat("dd-MM-yyyy").format(date).toString();

    notifyListeners();
  }

  void removeFromContactList(int index)
  {
    contactlist.removeAt(index);
    notifyListeners();
  }    

  void addToContactList(String name, String email, String dob, int number)
  {
    contactlist.add(Contact(name: name, email: email, dob: dob, number: number));
    nameController.clear();
    emailController.clear();
    dobController.clear();
    numberController.clear();
    notifyListeners();
  }

  void showDialogToAddContact(BuildContext context)
  {
    showDialog(context: context, builder: (context)
    {
      return AlertDialog(
        
        title: Text("New Contact"),
        content: DialogList(),
        actions: [
          TextButton(onPressed: () {
            nameController.clear();
            emailController.clear();
            dobController.clear();
            numberController.clear();
            Navigator.pop(context);
          }, child: Text("Cancel")),
          TextButton(onPressed: () {
            addToContactList(nameController.text, emailController.text, dobController.text, int.parse(numberController.text));
            Navigator.of(context).pop();

          },child: Text("Add"))
        ],
      );

    });
    notifyListeners();
  }  


  void showDialogToEditContact(int index, BuildContext context)
  {
    nameController.text = contactlist[index].name;
    emailController.text = contactlist[index].email;
    dobController.text = contactlist[index].dob;
    numberController.text = contactlist[index].number.toString();


    showDialog(context: context, builder: (context)
    {
      return AlertDialog(
        
        title: Text("Edit Contact"),
        content: DialogList(),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          }, child: Text("Cancel")),
          TextButton(onPressed: () {
            removeFromContactList(index);
            addToContactList(nameController.text, emailController.text, dobController.text, int.parse(numberController.text));
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },child: Text("Update"))
        ],
      );

    });
    notifyListeners();
  }  


  

}





