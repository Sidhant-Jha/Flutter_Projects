import 'package:firebase_api/modules/auth/model/user_model.dart';
import 'package:firebase_api/modules/chat/all_chat/service/all_chat_firestore_service.dart';
import 'package:flutter/material.dart';

class AllChatViewModel extends ChangeNotifier
{
  final _service = AllChatFirestoreService();

  List<UserModel> users = [];
  
  void onSearchQueryChangeEvent(String query) async
  {
    users = await _service.searchUsers(query);
    notifyListeners();
  }
}