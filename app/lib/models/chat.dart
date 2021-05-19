class Chat {
  String sender;
  String message;

  Chat({this.sender, this.message});

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(sender: json['sender'], message: json['message']);
  }
  dynamic toJson() => {'sender': sender, 'message': message};
}
