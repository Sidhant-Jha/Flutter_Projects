import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_localstorage/modules/delete/view_model/delete_view_model.dart';

class CreateDeleteLoaderOverlay extends StatelessWidget {
  const CreateDeleteLoaderOverlay({
    super.key,
    required this.string
  });

  final String string;
  @override
  Widget build(BuildContext context) {
    return Selector<DeleteViewModel, bool>(
      selector: (context, viewModel) => viewModel.isLoading,
      builder: (context, isLoading, child) {
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
      },
    );
      
  }
}