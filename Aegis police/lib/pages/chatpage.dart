import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugapp/components/chatpage/chat_bubble.dart';
import 'package:drugapp/components/loginpage/mytextfield.dart';
import 'package:drugapp/services/Authf/auth_service.dart';
import 'package:drugapp/services/chat/chat_services.dart';
import 'package:flutter/material.dart';

class Chatpage extends StatefulWidget {
  final String receiverEmail;
  final String receiverID;
  Chatpage({
    super.key,
    required this.receiverEmail,
    required this.receiverID,
    });

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
    final TextEditingController msgController = TextEditingController();

    final ChatService chatService = ChatService();

    final AuthService authService = AuthService();

     FocusNode focusNode = FocusNode();

  @override
  void initState(){
    super.initState();

    focusNode.addListener((){
      if(focusNode.hasFocus){
        Future.delayed(
          const Duration(milliseconds: 500),
          ()=> scrollDown(),
        );
      }
    });

    Future.delayed(
      const Duration(microseconds: 500),
      () => scrollDown(),
    );
  }

  @override
  void dispose(){
    focusNode.dispose();
    msgController.dispose();
    super.dispose();
  }

  final ScrollController scrollController = ScrollController();
  void scrollDown(){
    scrollController.animateTo(scrollController.position.maxScrollExtent, 
    duration: const Duration(seconds: 1), 
    curve: Curves.fastOutSlowIn,
    );
  }


  void sendMessage() async{
    if(msgController.text.isNotEmpty){
      await chatService.sendMessage(widget.receiverID,msgController.text);

      msgController.clear();
    }
    scrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        title: Text(widget.receiverEmail),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        ),
      body: Column(
        children: [
          Expanded(
            child:buildMessageList(),
          ),
          userInput(),
        ],
      ),
    );
  }

  Widget buildMessageList(){
    String senderID = authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: chatService.getMessages(widget.receiverID, senderID),
      builder: (context,snapshot){
        if(snapshot.hasError){
          return Center(child: const Text("Error"));
        }
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: const Text("Loading...."));
        }
        return ListView(
          controller: scrollController,
          children: snapshot.data!.docs.map((doc)=> buildMessageItem(doc)).toList(),
        );
      },
      );
  }

  Widget buildMessageItem(DocumentSnapshot doc){
    Map<String,dynamic>data = doc.data()as Map<String,dynamic>;
    bool currentUser=data['senderID']==authService.getCurrentUser()!.uid;

    var align = currentUser ? Alignment.centerRight:Alignment.centerLeft;

    return Container(
      alignment: align,
      child: Column(
        crossAxisAlignment: currentUser? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          ChatBubble(message: data["message"], currentUser: currentUser),
        ],
      ));
  }

  Widget userInput(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Mytextfield(
            controller: msgController, 
            hinttext: "Message",
            obscuretext: false,
            focusNode: FocusNode(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Container(
              decoration: BoxDecoration(
             // borderRadius: BorderRadius.circular(40),
              shape: BoxShape.circle,
              color: Colors.green),
              child: Center(child: IconButton(onPressed: sendMessage, icon: Icon(Icons.send,color: Colors.white,)))),
          )
        ],
      ),
    );
  }
}