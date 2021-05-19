import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:app/models/chat.dart';
import 'package:http/http.dart' as http;

class ChatProvider with ChangeNotifier {
  ChatProvider() {
    this.fetchChats();
  }
  List<Chat> _chat = [];

  List<Chat> get chat {
    return [..._chat];
  }

  void addChat(Chat chat) async {
    final resurl = Uri.parse('http://10.0.2.2:8000/apis/v1/');
    final response = await http.post(resurl,
        headers: {"Content-type": "application/json"}, body: json.encode(chat));
    if (response.statusCode == 201) {
      _chat.add(chat);
      notifyListeners();
    }
  }

  fetchChats() async {
    var resurl = Uri.parse('http://10.0.2.2:8000/apis/v1/?format=json');
    var response = await http.get(resurl);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _chat = data.map<Chat>((json) => Chat.fromJson(json)).toList();
      notifyListeners();
    }
  }
}
