import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_shared_preference/view/todo_item_dialog.dart';
import 'package:todo_shared_preference/view_model/todo_view_model.dart';

class TodoItems extends StatelessWidget {
  TodoItems({super.key, required this.index});

  final int index;


  @override
  Widget build(BuildContext context) {

    final providerRead = context.read<TodoViewModel>().list[index];


    return ExpansionTile(
      leading: InkWell(
              onTap: () {},
              child: Transform.scale(
                scale: 1.1, //default is 1
                child: Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  value: providerRead.isCompleted,
                    onChanged: (value) {
                      // print("${providerRead.isCompleted}" + "Amadeus");
                      context.read<TodoViewModel>().toggleTodo(providerRead.dueDate, providerRead.title, providerRead.dueTime);
                      context.read<TodoViewModel>().showcompletedDate(providerRead.dueDate, providerRead.title, providerRead.dueTime);
                      context.read<TodoViewModel>().showcompletedTime(providerRead.dueDate, providerRead.title, providerRead.dueTime, context);
                    }
                  ),
              ),
            ),
      title: Text(providerRead.title,
              style: TextStyle(
                fontSize: 20,
                decoration: providerRead.isCompleted ? TextDecoration.lineThrough  : TextDecoration.none
              ),),
      children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(providerRead.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),),
                        Spacer(),
                        IconButton.filled(
                        onPressed: ()=> context.read<TodoViewModel>().deleteTodo(providerRead.dueDate, providerRead.title, providerRead.dueTime),
                        icon: Icon(Icons.delete)
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_month),
                                Text(" Due Date : ${providerRead.dueDate}", style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.access_time_filled),
                                Text(" Due Time : ${providerRead.dueTime}", style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                            SizedBox(height: 5,),
                            if((providerRead.isCompleted))
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.check_circle, color: Colors.green,),
                                        Text(" Completed At Date : ${providerRead.completedDate}", style: TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.bold
                                        ),)
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        Icon(Icons.check_circle, color: Colors.green,),
                                        Text(" Completed At Time : ${providerRead.completedTime}", style: TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.bold
                                        ),)
                                      ],
                                    ),
                                  ],
                                ),
                          ],
                        ),
                            Spacer(),
                            IconButton.filled(onPressed: () {},
                            icon: Icon(Icons.edit)
                          )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
      ],  
    );
  
  }
}

