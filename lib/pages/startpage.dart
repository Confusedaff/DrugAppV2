import 'package:drugapp/components/Intro/intro_page1.dart';
import 'package:drugapp/components/Intro/intro_page2.dart';
import 'package:drugapp/components/Intro/intro_page3.dart';
import 'package:drugapp/services/Authf/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Startpage extends StatefulWidget {
  const Startpage({super.key});

  @override
  State<Startpage> createState() => _StartpageState();
}

PageController pcontroller = PageController();

bool lastPage = false;

class _StartpageState extends State<Startpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
              controller: pcontroller,
              onPageChanged: (index) {
                setState(() {
                  lastPage = (index == 2);
                });
              },
              children: [
                IntroPage1(),
                IntroPage2(),
                IntroPage3(),
              ]),
          Container(
              alignment: Alignment(0, 0.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        pcontroller.jumpToPage(2);
                      },
                      child: Text('skip')),
                  SmoothPageIndicator(controller: pcontroller, count: 3),
                  lastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return AuthGate();
                            }));
                          },
                          child: Text('done'))
                      : GestureDetector(
                          onTap: () {
                            pcontroller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Text('next'),
                        )
                ],
              )),
        ],
      ),
    );
  }
}
