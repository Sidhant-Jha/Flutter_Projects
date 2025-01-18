// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class TodoViewScreen extends StatelessWidget {
//   const TodoViewScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_model.dart';

class TodoViewScreen extends StatelessWidget {
  TodoViewScreen({super.key, required this.model});


  final TodoModel model;

  @override
  Widget build(BuildContext context) {

    return ExpansionTile(
      leading: InkWell(
              onTap: () {

              },
              child: Transform.scale(
                scale: 1.1, //default is 1
                child: Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  value: false,
                    onChanged: (value) {
                     
                    }
                  ),
              ),
            ),
      title: Text(model.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: 23,
                // decoration: providerRead.isCompleted ? TextDecoration.lineThrough  : TextDecoration.none
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
                        if(model.description != null)
                          Expanded(
                            child: Text('Description : ${model.description!}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),),
                          ),
                        if(model.description == null)
                          Expanded(
                            child: Text('No Description',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),),
                          ),
                        // Expanded(
                        //   child: Container(), // Ensures the delete icon is pushed to the end
                        // ),

                        IconButton.filled(
                        onPressed: () {},// context.read<TodoViewModel>().deleteTodo(providerRead.dueDate, providerRead.title, providerRead.dueTime),
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
                                Text(" Due Date : ${model.dueDate}", style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.access_time_filled),
                                Text(" Due Time : ${model.dueTime}", style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                            SizedBox(height: 5,),
                            // if((providerRead.isCompleted))
                            //     Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Row(
                            //           children: [
                            //             Icon(Icons.check_circle, color: Colors.green,),
                            //             Text(" Completed At Date : ${providerRead.completedDate}", style: TextStyle(
                            //               fontSize: 18, fontWeight: FontWeight.bold
                            //             ),)
                            //           ],
                            //         ),
                            //         SizedBox(height: 5,),
                            //         Row(
                            //           children: [
                            //             Icon(Icons.check_circle, color: Colors.green,),
                            //             Text(" Completed At Time : ${providerRead.completedTime}", style: TextStyle(
                            //               fontSize: 18, fontWeight: FontWeight.bold
                            //             ),)
                            //           ],
                            //         ),
                            //       ],
                            //     ),
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
