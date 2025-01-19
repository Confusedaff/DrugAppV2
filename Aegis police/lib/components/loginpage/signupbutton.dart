import 'package:flutter/material.dart';

class Signupbutton extends StatelessWidget {
final Function()? onTap;

  const Signupbutton({
    super.key,
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),

      child: GestureDetector(
        onTap:onTap,
        child: Container(
          decoration:const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          child:const Center(
            child:Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  ),
                ),
            )),
        ),
      ),
    );
  }
}