import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/todo/view_model/todo_view_model.dart';

class CreateTodoLoaderOverlay extends StatelessWidget {
  const CreateTodoLoaderOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<TodoViewModel>().isLoading;
    if (!isLoading) return const SizedBox.shrink();
    return PopScope(
      canPop: false,
      child: Container(
        constraints: const BoxConstraints.expand(),
        color: Colors.black54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 12,),
            Text("Saving....", style: Theme.of(context).textTheme.titleSmall,)
          ],
        ),
      ),
    );
  }
}