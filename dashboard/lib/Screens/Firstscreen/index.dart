import 'package:dashboard/Screens/secondscreen/index.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
      Container(
        color: Colors.white,
        height: 70,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100.0,
            ),
            Row(children: [
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => secondscreen())),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.0),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Row(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/search.png',
                          height: 25.0,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Center(
                        child: Text(
                          'Find Colleges',
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 50.0,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Dashboard',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                width: 50.0,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Profile',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                width: 50.0,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Vault',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                width: 50.0,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Colleges',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                width: 50.0,
              ),
              InkWell(
                  onTap: () {},
                  child: Image.asset('assets/bell.png', height: 40.0)),
              SizedBox(
                width: 50.0,
              ),
            ])
          ],
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height - 70,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[600],
        child: Stack(
          children: [
            Positioned(
                top: 80.0,
                left: 310.0,
                child: Container(
                  color: Colors.white,
                  width: 800,
                  height: 300,
                  child: Column(
                    children: [
                      Text(
                        "My Uni's",
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )
                    ],
                  ),
                ))
          ],
        ),
      )
    ]))));
  }
}
