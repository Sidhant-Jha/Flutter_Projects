import 'package:firebase_api/modules/auth/model/user_model.dart';
import 'package:firebase_api/modules/chat/all_chat/view_model/all_chat_view_model.dart';
import 'package:firebase_api/modules/chat/chat/view/chat_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllChatListBuilder extends StatelessWidget {
  const AllChatListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<AllChatViewModel, List<UserModel>>(
      selector: (_, vm) => vm.users,
      builder: (context, users, child) {
        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index)
          {
            final user = users[index];
            return ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ChatScreenProvider(receiver: user,)));
              },
              leading: user.photoURL != null ? 
              CircleAvatar(backgroundImage: NetworkImage(user.photoURL.toString()),) :
              CircleAvatar(child: Icon(Icons.person),),
              title: Text(user.userName ?? "Unknown"),
            );
          }
        );
      },
    );
  }
}