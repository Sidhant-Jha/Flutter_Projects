import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_model.dart';
import 'package:todo_app_localstorage/modules/todos/model/todo_priority.dart';
import 'package:todo_app_localstorage/modules/todos/view/dialog/todo_dialog_helper.dart';
import 'package:todo_app_localstorage/modules/todos/view/todo_update_screen.dart';
import 'package:todo_app_localstorage/modules/todos/view_model/view_model.dart';

class TodoViewScreen extends StatelessWidget {
  TodoViewScreen({super.key, required this.model});


  final TodoModel model;

  @override
  Widget build(BuildContext context) {

    return
        ExpansionTile(
          leading: InkWell(
                  onTap: () {},
                  child: Transform.scale(
                    scale: 1.1, //default is 1
                    child: Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      value: model.status,
                        onChanged: (value) {
                          context.read<TodoViewModel>().toggleStatus(previousModel: model);
                        }
                      ),
                  ),
                ),
          trailing: ElevatedButton(onPressed: null, child: Text(model.priority.name, style: TextStyle(color: _getColor(model.priority), fontSize: 16),)),
          title: Text(model.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 21,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Title : ${model.title}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                          ),),
                        const SizedBox(height: 5,),
                        Row(
                          children: [
                            if(model.description != null)
                              Expanded(
                                child:
                                 Text('Description : ${model.description!}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),),
                              ),
                            if(model.description == null)
                              const Expanded(
                                child: 
                                Text('No Description',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),),
                              ),
                            IconButton.filled(
                            onPressed: () {
                            TodoDialogHelper.showDeleteConfirmationDialog(context, () {
                                context.read<TodoViewModel>().deleteTodoEvent(todo: model);
                              });
                            },
                            icon: const Icon(Icons.delete)
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_month),
                                    Text(" Due Date : ${model.dueDate}", style: const TextStyle(
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
                                if(model.status!)
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.check_circle, color: Colors.green,),
                                            Text(" Completed At Date : ${model.completedDate}", style: TextStyle(
                                                fontSize: 18, fontWeight: FontWeight.bold
                                              ),),
                                          ],
                                        ),
                                        SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            Icon(Icons.check_circle, color: Colors.green,),
                                            Text(" Completed At Time : ${model.completedTime}", style: TextStyle(
                                              fontSize: 18, fontWeight: FontWeight.bold
                                            ),)
                                          ],
                                        ),
                                      ],
                                    ),
                              ],
                            ),
                                Spacer(),
                                IconButton.filled(onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => ChangeNotifierProvider.value(
                                    value: context.read<TodoViewModel>(),
                                    child: TodoUpdateScreen(model: model))));
                                },
                                icon: Icon(Icons.edit)
                              )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
          ]
    );
  }
  
  Color _getColor(TodoPriority priority) {
    switch(priority)
    {
      case TodoPriority.low : return Colors.green;
      case TodoPriority.medium : return Colors.yellow;
      case TodoPriority.high : return Colors.red;
    }
  } 
}
