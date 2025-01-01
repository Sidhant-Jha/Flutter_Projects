import 'package:flutter/material.dart';
import 'package:prac_contact/views/model_view.dart';
import 'package:prac_contact/widgets/contact_list.dart';
import 'package:provider/provider.dart';

class ContactView extends StatelessWidget
{
  const ContactView({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    ContactViewModel contextread = context.read<ContactViewModel>();
    return InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Row(
                            children: [
                              const Text('Contact Info'),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  contextread.showDialogToEditContact(index, context);
                                },
                                icon: const Icon(Icons.edit),
                              ),
                            ],
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.contacts),
                                  const SizedBox(width: 12,),
                                  Flexible(child: Text("Contact Name : ${contextread.contactlist[index].name}", style: const TextStyle(fontSize: 20),)),
                                ],
                              ),
                              const SizedBox(height: 15,),
                              Row(
                                children: [
                                  const Icon(Icons.email),
                                  const SizedBox(width: 12,),
                                  Flexible(child: Text("Email ID : ${contextread.contactlist[index].email}", style: const TextStyle(fontSize: 20),)),
                                ],
                              ),
                              const SizedBox(height: 15,),
                              Row(
                                children: [
                                  const Icon(Icons.calendar_month),
                                  const SizedBox(width: 12,),
                                  Flexible(child: Text("Date of Birth : ${contextread.contactlist[index].dob}", style: const TextStyle(fontSize: 20),)),
                                ],
                              ),
                              const SizedBox(height: 15,),
                              Row(
                                children: [
                                  const Icon(Icons.phone),
                                  const SizedBox(width: 12,),
                                  Flexible(child: Text("Phone Number : ${contextread.contactlist[index].number}", style: const TextStyle(fontSize: 20),)),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: ContactList(index: index)
                );
  }
  
}