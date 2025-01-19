import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Aboutuspage extends StatefulWidget {
  const Aboutuspage({super.key});

  @override
  State<Aboutuspage> createState() => _AboutuspageState();
}

class _AboutuspageState extends State<Aboutuspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text("             About Us"),
      ),
      body: Column(
        children: [
          Center(
            child: Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: Lottie.asset("assets/animations/cat.json"),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              "Just three guys trying to make a change in the \n       world in whatever small way they can.",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          )
        ],
      ),
    );
  }
}
