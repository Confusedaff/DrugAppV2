import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        body: Column(children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 420, // Set a fixed height for the Stack
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Lottie.asset("assets/animations/people.json"),
                ),
                Positioned(
                    top: 190,
                    left: 0,
                    right: 180,
                    child: SizedBox(
                      width: 170,
                      height: 170,
                      child: Lottie.asset("assets/animations/phone.json"),
                    )),
                Positioned(
                    top: 240,
                    left: 140,
                    right: 0,
                    child: SizedBox(
                      width: 170,
                      height: 170,
                      child: Lottie.asset("assets/animations/like.json"),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Text(
                "Share your story with the world.\n",
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
