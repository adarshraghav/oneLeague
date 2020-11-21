import 'package:flutter/material.dart';

class Bu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: -5,
              left: -10,
              child: Image.asset(
                'assets/bu.jpg',
                height: 300,
              ),
            ),
            Positioned(
              top: 273,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(250, 250, 250, 1),
                ),
                height: 40,
                width: 375,
              ),
            ),
            Positioned(
              top: 255,
              left: 30,
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(250, 250, 250, 1),
                    borderRadius: BorderRadius.circular(6)),
                child: Text("  COLLEGE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.black,
                    )),
                height: 40,
                width: 100,
              ),
            ),
            Positioned(
                top: 48,
                left: 15,
                child: Text(
                  "#1 emerging university",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )),
            Positioned(
                top: 285,
                left: 18,
                child: Text(
                  "Bennett University",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                )),
            Positioned(
                top: 320,
                left: 18,
                child: Row(
                  children: [
                    Text(
                      "4 Year",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.grey,
                      size: 6,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Greater Noida, UP",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                )),
            Positioned(
                top: 350,
                left: 10,
                child: Stack(
                  children: [
                    Container(
                      child: Text(
                          "Bennett University is a private university located in Greater Noida, Uttar Pradesh in the National Capital Region, India. Founded in 2016 by Times of India Group."),
                      height: 200,
                      width: 355,
                      color: Colors.transparent,
                    ),
                  ],
                )),
            Positioned(
                right: 130,
                top: 427,
                child: Image.asset(
                  'assets/Aplus.png',
                  height: 100,
                )),
            Positioned(
                right: 100,
                top: 534,
                child: Text(
                  'Overall oneLeague Grade',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            Positioned(
                left: 20,
                top: 580,
                child: Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: Colors.blue,
                    ),
                    Text(
                      ' https://www.bennett.edu.in/',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue),
                    )
                  ],
                )),
            Positioned(
                left: 20,
                top: 615,
                child: Row(
                  children: [
                    Icon(
                      Icons.room,
                      color: Colors.green,
                    ),
                    Text(
                      ' Plot Nos 8-11, TechZone 2,\n Greater Noida,\n Uttar Pradesh 201310',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                )),
            Positioned(
              right: 20,
              bottom: 50,
              child: FloatingActionButton.extended(
                onPressed: () {},
                label: Text('Apply Today'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
