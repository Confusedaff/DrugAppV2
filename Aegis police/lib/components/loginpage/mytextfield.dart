import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  final controller;
  final String hinttext;
  final bool obscuretext;
  final FocusNode? focusNode;

  const Mytextfield({
    super.key,
    required this.controller,
    required this.hinttext,
    required this.obscuretext,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscuretext,
        focusNode: focusNode,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .inversePrimary), //Colors.grey.shade400)
            ),
            fillColor: Colors.grey[100],
            filled: true,
            hintText: hinttext,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
