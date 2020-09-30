import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<PageViewModel> getPages() {
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return [
      PageViewModel(
        image: Image.asset(
          "assets/undraw_searching_p5ux.png",
          alignment: Alignment.bottomCenter,
        ),
        title: "Search & Seek",
        body:
            "We you search for your ideal univeristy. Search for private universities all around the country.",
        decoration: pageDecoration,
      ),
      PageViewModel(
          image: Image.asset(
            "assets/undraw_having_fun_iais.png",
            height: 175,
            alignment: Alignment.bottomCenter,
          ),
          title: "Work Hard & Party Hard",
          body:
              "Stay ahead of everyone. Plan early and apply early, so that you've ample of time to Party!",
          decoration: pageDecoration),
      PageViewModel(
          image: Image.asset(
            "assets/undraw_Choose_bwbs.png",
            alignment: Alignment.bottomCenter,
            height: 100,
          ),
          title: "Know Your Date!",
          body:
              "Keep track of all your applications, deadlines and submissions with accepted.",
          decoration: pageDecoration),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      done: Text("Done"),
      onDone: () {},
      pages: getPages(),
      globalBackgroundColor: Colors.white,
      next: Icon(Icons.arrow_forward),
      showSkipButton: true,
      skip: Text("Skip"),
    );
  }
}
