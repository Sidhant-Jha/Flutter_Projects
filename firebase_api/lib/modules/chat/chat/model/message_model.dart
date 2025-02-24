class MessageModel {
  const MessageModel({
    required this.id,
    required this.value,
    required this.sentBy,
    required this.createdAt
  });

  factory MessageModel.fromMap(Map<String, dynamic> map)
  {
    return MessageModel(id: map['id'],
     value: map['value'],
     sentBy: map['sentBy'],
     createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
     );
  }

  Map<String, dynamic> toMap()
  {
    return {
      'id' : id,
      'value' : value,
      'sentBy' : sentBy,
      'createdAt' : createdAt.millisecondsSinceEpoch
    };
  }

  final String id;
  final String value;
  final String sentBy;
  final DateTime createdAt;
}