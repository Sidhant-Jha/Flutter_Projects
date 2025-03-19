import 'package:firebase_api/modules/chat/all_chat/view/widgets/all_chat_list_builder.dart';
import 'package:firebase_api/modules/chat/all_chat/view_model/all_chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllChatScreen extends StatelessWidget {
  const AllChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Chats"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16
        ),
        child: Column(
          children: [
            TextField(
              onChanged: context.read<AllChatViewModel>().onSearchQueryChangeEvent,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                hintText: "Search by name"
              ),
            ),
            Expanded(child: AllChatListBuilder())
          ],
        ),
      ),
    );
  }
}