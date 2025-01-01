import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_shared_preference/model/model.dart';
import 'package:todo_shared_preference/view/todo_item_dialog.dart';
import 'package:todo_shared_preference/view/todo_items.dart';
import 'package:todo_shared_preference/view_model/todo_view_model.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});


  @override
  Widget build(BuildContext context) {

    final providerWatch = context.watch<TodoViewModel>();
    // final providerWatch = context.watch<TodoViewModel>();
    // List<Todo> tempoList = context.read<TodoViewModel>().list;
    final textController = TextEditingController();
  
    // List<Todo> todos = context.read<TodoViewModel>().list;
  

    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        actions: [
          IconButton.filledTonal(
            onPressed: () => providerWatch.changeTheme(), 
            icon: Icon(Icons.brightness_6)
          ),
          
          PopupMenuButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            position: PopupMenuPosition.under,
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {
                  context.read<TodoViewModel>().todosAll();
                  print(context.read<TodoViewModel>().list);
                },
                child: Text("All Todos")
              ),
              PopupMenuItem(
                onTap: () {
                  context.read<TodoViewModel>().todosCompleted();
                  print(context.read<TodoViewModel>().list);
                },
                child: Text("Completed")
              ),
              PopupMenuItem(
                onTap: () {
                  context.read<TodoViewModel>().todosNotCompleted();
                  print(context.read<TodoViewModel>().list);
                },
                child: Text("Not Completed")
              )
            ]
          )
        ],
        elevation: 2,
        shadowColor: Colors.black,
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(25)
            ),
            
            width: 350,
            child: TextField(
              onChanged: context.read<TodoViewModel>().searchTodo,
              controller: providerWatch.textController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.all(10),
                hintText: "Search task",
                border: InputBorder.none,
                
              ),
            ),
          ),
          SizedBox(height: 20,),
          providerWatch.list.isEmpty ? Expanded(child: Center(child: Text("No Works to do...")))
                : Expanded(
                  child: ListView.builder(
                    itemCount: providerWatch.list.length,
                    itemBuilder: (context, index)
                    {
                      return TodoItems(index: index,);
                    }
                  ),
                ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () => showDialogToAddTask(context),
        child: Icon(Icons.add),
      ),
    );
  }


  void showDialogToAddTask(BuildContext context)
  {
    showDialog(context: context, builder: (context)
    {
      return TodoItemDialog();
    });
  }

}
