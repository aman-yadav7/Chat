import 'package:app/models/chat.dart';
import 'package:app/services/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/ui/components/constants.dart';

class ChatScreen extends StatelessWidget {
  final messageTextController = TextEditingController();
  String messageText;

  @override
  Widget build(BuildContext context) {
    final chatP = Provider.of<ChatProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //crossAxisAlignment:isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: chatP.chat.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(chatP.chat[index].sender),
                  subtitle: Text(chatP.chat[index].message),
                );
              },
            ),
            SendChat(),
          ],
        ),
      ),
    );
  }
}

class SendChat extends StatefulWidget {
  @override
  _SendChatState createState() => _SendChatState();
}

class _SendChatState extends State<SendChat> {
  final messageTextController = TextEditingController();
  String messageText;

  void send() {
    final String textVal = messageTextController.text;
    if (textVal.isNotEmpty) {
      final Chat chat = Chat(sender: "1", message: textVal);
      Provider.of<ChatProvider>(context, listen: false).addChat(chat);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kMessageContainerDecoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: messageTextController,
              onChanged: (value) {
                messageText = value;
              },
              decoration: kMessageTextFieldDecoration,
            ),
          ),
          FlatButton(
            onPressed: () {
              send();
              messageTextController.clear();
            },
            child: Text(
              'Send',
              style: kSendButtonTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
