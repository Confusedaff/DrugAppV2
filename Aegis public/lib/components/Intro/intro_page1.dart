import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        body: Column(children: [
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 400, // Set a fixed height for the Stack
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Lottie.asset("assets/animations/meditation.json"),
                ),
                // Positioned(
                ///  top: 130,
                //  left: 30,
                //  right: 0,
                //  child: Lottie.asset("assets/animations/map1.json"),
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: 0,
          ),
          Column(
            children: [
              Text(
                "Some things are meant to be changed.\n",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    height: 1),
              ),
            ],
          )
        ]));
  }
}
