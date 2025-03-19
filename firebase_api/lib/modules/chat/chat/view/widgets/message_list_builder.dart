import 'package:firebase_api/modules/chat/chat/model/message_model.dart';
import 'package:firebase_api/modules/chat/chat/view_model/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageListBuilder extends StatelessWidget {
  const MessageListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<ChatViewModel, List<MessageModel>>(
      selector: (_, vm) => vm.messages,
      builder: (context, messages, child) {
        return ListView.separated(
          reverse: true,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          separatorBuilder: (context, index)
          {
            return SizedBox(height: 2,); 
          },
          itemCount: messages.length,
          itemBuilder: (context, index)
          {
            final screenWidth = MediaQuery.of(context).size.width;
            final message = messages[index];
            return Align(
              alignment: message.isSender ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: screenWidth * 0.6,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: message.isSender ? Radius.circular(8) : Radius.zero,
                    bottomRight: !message.isSender ? Radius.circular(8) : Radius.zero
                  )
                ),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(message.value, style: Theme.of(context).textTheme.bodyMedium),
              ),
            );
        });
      },
    );
  }
}