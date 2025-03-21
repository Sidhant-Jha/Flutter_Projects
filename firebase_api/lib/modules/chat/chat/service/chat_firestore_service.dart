import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_api/modules/auth/model/user_model.dart';
import 'package:firebase_api/modules/auth/services/auth_service.dart';
import 'package:firebase_api/modules/auth/view/auth_screen.dart';
import 'package:firebase_api/modules/chat/chat/model/chat_model.dart';
import 'package:firebase_api/modules/chat/chat/model/message_model.dart';

class ChatFirestoreService {
  final _client = FirebaseFirestore.instance;

  final _authService = AuthService();

  Future<String?> getChatId(UserModel model) async
  {
    final sender = _authService.getUser();
    if(sender == null) return null;

    final senderId = sender.uid;
    final receiverId = model.id;

    final chatId = senderId.compareTo(receiverId) >=0 
        ? '${senderId}_$receiverId'
        : '${receiverId}_$senderId';

    final chatRef = _client.collection('chats').doc(chatId);

    final isChatCreated = await chatRef.get().then(
      (doc) => doc.exists,
    );

    if(isChatCreated)
    {
      return chatId;
    }
    else{
      final model = ChatModel(id: chatId);
      await chatRef.set(model.toMap());
      return chatId;
    }
  }

  void sendMessage(String message, String chatId) async
  {

    final sender = _authService.getUser();
    if(sender == null) return null;

    final ref = _client.collection('chats').doc(chatId).collection('messages');
    final docRef = ref.doc();

    final model = MessageModel(id: docRef.id, value: message, sentBy: sender.uid, createdAt: DateTime.now(), isSender: true);

    await docRef.set(model.toMap());
  }

  Future<List<MessageModel>> getAllChats(String? chatId)
  {
    final ref = _client.collection('chats').
              doc(chatId).
              collection('messages').
              orderBy('createdAt', descending: true);

    final sender = _authService.getUser();

    // final streamSnapshot = ref.snapshots();
    // final streams = streamSnapshot.asyncMap((snapshot)
    // {
    //     final messages = snapshot.docs
    //         .map((doc) => MessageModel.fromMap(doc.data(), isSender: doc.data()['sentBy'] == sender?.uid 
    //           )).toList();

    //     return messages;
    // });

    //below part without stream
    final messages = ref.get().
                    then((snapshot) => snapshot.docs
                    .map((doc) => MessageModel.fromMap(doc.data(), isSender: doc.data()['sentBy'] == sender?.uid 
                    )).toList());

    return messages;

    // return streams;

  }


}