import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fruit_shop/constants/app_constants.dart';
import 'package:fruit_shop/screens/home_screen.dart';
import 'package:slide_to_act/slide_to_act.dart';


class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hay Markets',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.05,
                      ),
                    ),
                    Text(
                      'First Online',
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Market',
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Our market always provide fresh items from the local farmers, let\'s support local with us!',
                      style: TextStyle(
                        height: 1.4,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.40,
                width: double.infinity,
                child: Image.asset(
                  "assets/bg.png",
                  fit: BoxFit.fill,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: SlideAction(
                  height: 60,
                  outerColor: kPrimaryColor,
                  sliderButtonIcon: Icon(
                    Icons.arrow_forward,
                    color: kPrimaryColor,
                    size: 15,
                  ),
                  text: 'SWIPE TO START',
                  textStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                  onSubmit: () {
                    Timer(
                        Duration(milliseconds: 1000),
                        (() => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => HomeScreen())))));
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'HOW TO SUPPORT',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'LOCAL FARMERS',
                  style: TextStyle(
                      fontSize: 12,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline),
                ),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
