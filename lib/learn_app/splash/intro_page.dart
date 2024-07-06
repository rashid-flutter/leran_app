// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../bottom_bar/curvedNav.dart';

class IntroPage extends StatefulWidget {
  // ignore: use_super_parameters
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  // ignore: prefer_final_fields
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // pageView
        PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              Container(
                color: Color.fromARGB(255, 255, 255, 255),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 220, left: 20, right: 20),
                        child: Image.asset(
                          'assets/images/photo4.gif',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        "Learn Basics!",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 270, left: 50, right: 50),
                      child: Image.asset(
                        'assets/images/photo3.gif',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Translate Sign language To Text",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                color: Color.fromARGB(255, 255, 255, 255),
                child: Center(
                    child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 220, left: 50, right: 50),
                      child: Image.asset(
                        'assets/images/photo1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Now Let's Get to Work!",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
              ),
            ]),
        //DotIndicator
        Container(
          alignment: Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // skip
              GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(fontSize: 19),
                  )),

              SmoothPageIndicator(
                controller: _controller,
                count: 3,
              ),

              //next
              onLastPage
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CurveBar()),
                        );
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 19,
                        ),
                      ))
                  : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(fontSize: 19),
                      )),
            ],
          ),
        )
      ],
    ));
  }
}
