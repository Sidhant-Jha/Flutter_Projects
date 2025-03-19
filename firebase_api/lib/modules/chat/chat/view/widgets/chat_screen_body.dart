import 'package:firebase_api/modules/chat/chat/view/widgets/message_list_builder.dart';
import 'package:firebase_api/modules/chat/chat/view_model/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreenBody extends StatefulWidget {
  ChatScreenBody({super.key});

  @override
  State<ChatScreenBody> createState() => _ChatScreenBodyState();
}

class _ChatScreenBodyState extends State<ChatScreenBody> {
  
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: MessageListBuilder()
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: TextField(
                  controller: messageController,
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    hintText:"Type your message...."
                  ),
                ),
              ),
            ),
            IconButton(onPressed: () {
              final message = messageController.text.trim();
                context.read<ChatViewModel>().sendMessageEvent(message);
            }, icon: Icon(Icons.send))
          ],
        )
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    messageController.dispose();
  }
}