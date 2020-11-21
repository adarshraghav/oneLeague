import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sqlite/pages/Dashboard/home_page.dart';

import 'bennett.dart';

class explore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget horizontalList1 = new Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 200.0,
        child: new ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Bu()));
              },
              child: Container(
                width: 160.0,
                color: Colors.transparent,
                child: Column(
                  children: [
                    SizedBox(
                      child: Image.asset(
                        "assets/bennett.png",
                        fit: BoxFit.fill,
                        height: 200,
                        width: 135,
                      ),
                      height: 120,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 85,
                        ),
                        Text("4.7 "),
                        Icon(
                          Icons.star,
                          color: Color.fromRGBO(17, 34, 63, 1),
                          size: 16,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Dash()));
              },
              child: Container(
                width: 160.0,
                color: Colors.transparent,
                child: Column(
                  children: [
                    SizedBox(
                      child: Image.asset(
                        "assets/vit.png",
                        fit: BoxFit.fill,
                        height: 180,
                        width: 105,
                      ),
                      height: 110,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 85,
                        ),
                        Text("4.2 "),
                        Icon(
                          Icons.star_half_sharp,
                          color: Color.fromRGBO(17, 34, 63, 1),
                          size: 16,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Dash()));
              },
              child: Container(
                width: 160.0,
                color: Colors.transparent,
                child: Column(
                  children: [
                    SizedBox(
                      child: Image.asset(
                        "assets/IITM.png",
                        fit: BoxFit.fill,
                        height: 180,
                        width: 112,
                      ),
                      height: 110,
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 85,
                        ),
                        Text("4.6 "),
                        Icon(
                          Icons.star,
                          color: Color.fromRGBO(17, 34, 63, 1),
                          size: 16,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Dash()));
              },
              child: Container(
                width: 160.0,
                color: Colors.transparent,
                child: Column(
                  children: [
                    SizedBox(
                      child: Image.asset(
                        "assets/Manipal.png",
                        fit: BoxFit.fill,
                        height: 200,
                        width: 118,
                      ),
                      height: 130,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
    Widget horizontalList2 = new Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 200.0,
        child: new ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 160.0,
              color: Colors.blue,
            ),
            Container(
              width: 160.0,
              color: Colors.green,
            ),
            Container(
              width: 160.0,
              color: Colors.cyan,
            ),
            Container(
              width: 160.0,
              color: Colors.black,
            ),
          ],
        ));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(
            children: [
              Positioned(
                left: -65,
                top: -50,
                child: Column(
                  children: [
                    Container(
                      width: 500,
                      child: CircleAvatar(
                        backgroundImage:
                            ExactAssetImage('assets/background.jpg'),
                        minRadius: 90,
                        maxRadius: 180,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  left: 30,
                  top: 250,
                  child: Container(
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            fontSize: 18.5,
                          ),
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(250, 250, 250, 0.95),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black,
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    height: 65,
                    width: 320,
                  )),
              Container(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    SizedBox(
                      height: 300,
                    ),
                    Text(
                      "  Top Picks For You",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(17, 34, 63, 1)),
                    ),
                    horizontalList1,
                  ],
                ),
              ),
              Positioned(
                  top: 35,
                  right: 10,
                  child: FloatingActionButton(
                    elevation: 100,
                    child: Icon(
                      Icons.person,
                      size: 32,
                    ),
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dash()));
                    },
                  )),
              Positioned(
                  left: -245,
                  top: 570,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 20,
                          width: 100,
                          child: Center(
                              child: Text('Examinations',
                                  style: TextStyle(color: Colors.white))),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            gradient: new LinearGradient(
                              colors: [Colors.red, Colors.blue],
                              begin: FractionalOffset.centerLeft,
                              end: FractionalOffset.centerRight,
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 260,
                              ),
                              Text(
                                'Mumbai University announces \nonline winter examination',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                "assets/mu.jpg",
                                height: 70,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 100,
                          child: Center(
                              child: Text('Unlock 5.0',
                                  style: TextStyle(color: Colors.white))),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            gradient: new LinearGradient(
                              colors: [Colors.orange, Colors.red],
                              begin: FractionalOffset.centerLeft,
                              end: FractionalOffset.centerRight,
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 260,
                              ),
                              Text(
                                'Colleges, universities to reope\nin Uttar Pradesh',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                "assets/up.jpg",
                                height: 70,
                                width: 130,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
