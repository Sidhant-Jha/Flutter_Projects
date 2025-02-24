import 'package:firebase_api/modules/chat/all_chat/view/all_chat_screen.dart';
import 'package:firebase_api/modules/chat/all_chat/view_model/all_chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllChatProvider extends StatelessWidget {
  const AllChatProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => AllChatViewModel(),
    child: AllChatScreen(),);
  }
}