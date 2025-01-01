import 'package:flutter/material.dart';
import 'package:prac_contact/widgets/contact_view.dart';
// import 'package:prac_contact/models/contact.dart';
import 'package:prac_contact/views/model_view.dart';
// import 'package:prac_contact/widgets/contact_list.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget
{
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    ContactViewModel contactwatch = context.watch<ContactViewModel>();
    ContactViewModel contactread = context.read<ContactViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Contact'),
      actions:[ IconButton.filledTonal(onPressed: () => contactread.changeTheme(), icon: Icon(Icons.brightness_6))],
      elevation: 4, shadowColor: Colors.black,),
      body: contactwatch.contactlist.isEmpty ?
        Center(child: Text('No Contacts yet !!'),) :
        ListView.separated(
          itemBuilder: (context, index)
          {
            return ContactView(index: index);
          },
          separatorBuilder: (context, index)
          {
            return Divider();
          },
          itemCount: contactwatch.contactlist.length
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => contactread.showDialogToAddContact(context),
        child: Icon(Icons.add),
      
      ),
    );
  }
  
}