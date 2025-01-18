import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_localstorage/modules/todos/view_model/view_model.dart';

class CreateTodoLoaderOverlay extends StatelessWidget {
  const CreateTodoLoaderOverlay({
    super.key,
    required this.string
  });

  final String string;
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
            Text("${string}....", style: Theme.of(context).textTheme.titleSmall,)
          ],
        ),
      ),
    );
  }
}