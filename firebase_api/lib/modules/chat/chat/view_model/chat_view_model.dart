import 'package:firebase_api/modules/auth/model/user_model.dart';
import 'package:firebase_api/modules/chat/chat/model/message_model.dart';
import 'package:firebase_api/modules/chat/chat/service/chat_firestore_service.dart';
import 'package:flutter/material.dart';

class ChatViewModel extends ChangeNotifier
{
  ChatViewModel({required this.receiver});
  String? chatId;
  final UserModel receiver;
  List<MessageModel> messages = [];

  final _service = ChatFirestoreService();

  bool get isChatCreated => chatId != null;
  String get appBarTitle =>  receiver.userName ?? "-";

  void sendMessageEvent(String message) async
  {
    if(!isChatCreated) return;
    _service.sendMessage(message, chatId!);
  }

  void loadChatMessages() async
  {
    messages = await _service.getAllChats(chatId);
    notifyListeners();
  }
  void init() async
  {
    chatId = await _service.getChatId(receiver);
    loadChatMessages();
  }





}