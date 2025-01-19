import 'package:drugapp/components/chatpage/user_tile.dart';
import 'package:drugapp/pages/chatpage.dart';
import 'package:drugapp/services/Authf/auth_service.dart';
import 'package:drugapp/services/chat/chat_services.dart';
import 'package:flutter/material.dart';

class Chatpagehome extends StatefulWidget {

 Chatpagehome({super.key});

  @override
  State<Chatpagehome> createState() => _ChatpagehomeState();
}

class _ChatpagehomeState extends State<Chatpagehome> {

  final ChatService chatService = ChatService();
  final AuthService authService= AuthService();

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:buildUserList(),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
    );
  }

Widget buildUserList(){
  return StreamBuilder(
    stream: chatService.getUserStream(),
    builder: (context,snapshot){
      if(snapshot.hasError){
        return Center(child: const Text("Error"));
      }

      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: const Text("Loading...."));
      }

      return ListView(
        children: snapshot.data!.map<Widget>((userData)=>buildUserListItem(userData,context)).toList(),
      );
    },
    );
 } 

 Widget buildUserListItem(Map<String,dynamic>userData,BuildContext context){

  if(userData["email"]!= authService.getCurrentUser()!.email){
    return UserTile(
    text:userData["email"],
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>Chatpage(
          receiverEmail: userData["email"],
          receiverID: userData["uid"],
        ),
        )
        );
    },
  );
  }else{
    return Container();
  }
 }
}