import 'package:firebase_api/modules/auth/model/user_model.dart';
import 'package:firebase_api/modules/chat/chat/view/chat_screen.dart';
import 'package:firebase_api/modules/chat/chat/view_model/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreenProvider extends StatelessWidget {
  const ChatScreenProvider({super.key, required this.receiver});

  final UserModel receiver;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ChatViewModel(receiver: receiver),
    child: ChatScreen(),);
  }
}