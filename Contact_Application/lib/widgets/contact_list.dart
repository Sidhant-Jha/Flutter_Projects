import 'package:flutter/material.dart';
import 'package:prac_contact/views/model_view.dart';
import 'package:provider/provider.dart';

class ContactList extends StatelessWidget
{
  ContactList({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    ContactViewModel contactread = context.read<ContactViewModel>();

    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(15),
        child: FittedBox(
          child: Text(contactread.contactlist[index].name.toUpperCase().substring(0, 1), style: TextStyle(color: Colors.black, fontSize: 25),)
          ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.amber
        ),
      ),
      title: Text(contactread.contactlist[index].name),
      trailing: IconButton(onPressed: () => contactread.removeFromContactList(index), icon: Icon(Icons.delete)),
    );
  }
  
}