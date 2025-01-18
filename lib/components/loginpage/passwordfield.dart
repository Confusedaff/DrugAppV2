import 'package:flutter/material.dart';

class Passwordfield extends StatefulWidget {

  final controller;
  final String hinttext;
  

  const Passwordfield({
    super.key,
    required this.controller,
    required this.hinttext,

    });

  @override
  State<Passwordfield> createState() => _MytextfieldState();
}

class _MytextfieldState extends State<Passwordfield> {

  bool obscure = true;
  IconData eyeButton = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    
    return  Row(

      children: [

        Expanded(
          child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal:25.0),
                     child: TextField(
                      controller: widget.controller,
                        decoration: InputDecoration(
                          enabledBorder:const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade400)
                          ),
                          fillColor: Colors.grey[200],
                          filled: true,
                          hintText: widget.hinttext,
                          hintStyle: TextStyle(color: Colors.grey[500])
                        ),
                      ),
                   ),
        ),

            IconButton(
              
                  onPressed: () {
                     setState(() {
                      obscure = !obscure;
                       //if(obscure==true){
                       // eyeButton;
                       //}else{
                       // Icons.visibility_off;
                      // }
                      eyeButton =
                          obscure ? Icons.visibility_off :Icons.visibility;
                     });
                  },
                   icon: Icon(eyeButton)
                   )
      ],
    );
  }
}