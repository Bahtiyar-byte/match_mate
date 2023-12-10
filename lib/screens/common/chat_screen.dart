import 'package:flutter/material.dart';
import '../../datastore/data_person.dart';

class ChatScreen extends StatelessWidget {
  final Person person;

  ChatScreen({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${person.name}'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ChatMessage(person: person, text: "Hi there! How's it going?", isSentByMe: false),
                  ChatMessage(person: person, text: "Hey! I'm good, thanks for asking. And you?", isSentByMe: true),
                  // Add more ChatMessages here to simulate more conversation
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Type a message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      // Implement sending message functionality
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}

class ChatMessage extends StatelessWidget {
  final Person person;
  final String text;
  final bool isSentByMe;

  ChatMessage({required this.person, required this.text, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isSentByMe)
          CircleAvatar(
            backgroundImage: AssetImage(person.imageAsset()),
          ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            decoration: BoxDecoration(
              color: isSentByMe ? Colors.blue : Colors.grey[300],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isSentByMe ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
