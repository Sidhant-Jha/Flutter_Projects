import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
import 'package:prac_contact/views/model_view.dart';
import 'package:provider/provider.dart';

class DialogList extends StatelessWidget
{
  const DialogList({super.key});

  @override
  Widget build(BuildContext context) {
    ContactViewModel contextread = context.read<ContactViewModel>();
    // ContactViewModel contextwatch = context.watch<ContactViewModel>();

    return  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10,),
            TextField(
              controller: contextread.nameController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))
              ],
              decoration: InputDecoration(
                hintText: "Contact Name",
                prefixIcon: Icon(Icons.contacts)
              ),
            ),
            SizedBox(height: 5,),
            TextField(
              controller: contextread.emailController,
              decoration: InputDecoration(
                hintText: "Email Id",
                prefixIcon: Icon(Icons.email)
              ),
            ),
            SizedBox(height: 5,),
            TextField(
              controller: contextread.dobController,
              // enabled: false,
              readOnly: true,
              onTap: ()=> contextread.showDateDialog(context),
              decoration: InputDecoration(
                hintText: "Date of Birth",
                prefixIcon: Icon(Icons.calendar_month)
              ),
            ),
            SizedBox(height: 5,),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: contextread.numberController,
              decoration: InputDecoration(
                hintText: "Phone Number",
                prefixIcon: Icon(Icons.phone)
              ),
            )
          ],
        );
  }
  
}