import 'package:drugapp/services/Authf/auth_service.dart';
import 'package:flutter/material.dart';

class Accountpage extends StatefulWidget {
  const Accountpage({super.key});

  @override
  State<Accountpage> createState() => _AccountpageState();
}

class _AccountpageState extends State<Accountpage> {

  void logout(){
  final auth = AuthService();
   auth.signOut();
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

    backgroundColor: Theme.of(context).colorScheme.tertiary,

      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.secondary,
              ),
             
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Text("                                        Log Out"),
                      onTap: (){
                        logout();
                        Navigator.popAndPushNamed(context,'/loginpage');
                      },
                      ),
                  ],
                ),  
              ),  
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.secondary,
              ),
             
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Text("                         Sign In From Another Account"),
                      onTap: (){
                        logout();
                        Navigator.popAndPushNamed(context,'/loginpage');
                      },
                      ),
                  ],
                ),  
              ),  
            ),
          ),
        ],

      ),
      appBar: AppBar(
        backgroundColor:Theme.of(context).colorScheme.tertiary,
        title:const Text("                Accounts"),
      ),
    );
  }
}