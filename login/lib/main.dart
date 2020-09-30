import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter project',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: 400.0,
                color: Colors.black,
                child: Column(
                  children: [
                    Image.asset('assets/pics.png'),
                  ],
                ),
              )),
          Positioned(
              left: 275,
              top: 60.0,
              child: Text(
                'Sign Up',
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 45.0,
                    color: Colors.black),
              )),
          Positioned(
              left: 420.0,
              top: 180.0,
              child: InkWell(
                onTap: () {},
                child: Container(
                  color: Colors.black,
                  height: 40.0,
                  width: 220,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/google3.png',
                          height: 25.0,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Center(
                        child: Text(
                          'Continue with Google',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Positioned(
              left: 420,
              top: 270,
              child: Container(
                height: 5.0,
                width: 220,
                child: Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
              )),
          Positioned(
              left: 420.0,
              top: 320.0,
              child: Container(
                  height: 30.0,
                  width: 220.0,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'E-Mail',
                        labelStyle: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                  ))),
          Positioned(
              left: 420.0,
              top: 380.0,
              child: InkWell(
                onTap: () {},
                child: Container(
                    height: 40.0,
                    width: 220.0,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        'Continue with E-Mail',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    )),
              )),
          Positioned(
              left: 280,
              top: 500,
              child: Text(
                'By clicking “Continue with Google/Email/SAML” above, you acknowledge that',
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w400,
                    color: Colors.black38),
              )),
          Positioned(
              left: 280,
              top: 520,
              child: Text(
                ' you have read and understood, and agree to:',
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w400,
                    color: Colors.black38),
              )),
          Positioned(
              left: 580.0,
              top: 520.0,
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Terms and Conditions',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ),
              )),
          Positioned(
              left: 729,
              top: 520.0,
              child: Text(
                'and',
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w400,
                    color: Colors.black38),
              )),
          Positioned(
              left: 760.0,
              top: 520.0,
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ),
              ))
        ],
      ),
    );
  }
}
