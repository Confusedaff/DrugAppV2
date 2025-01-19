
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {

  final String message;
  final bool currentUser;

  const ChatBubble({
    super.key,
    required this.message,
    required this.currentUser,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:currentUser? Colors.lightGreen : Colors.lightBlue,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 25),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(message,style: TextStyle(color: Colors.white),),
        ),
    );
  }
}