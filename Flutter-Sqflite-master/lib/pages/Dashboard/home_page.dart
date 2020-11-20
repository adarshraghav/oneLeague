import 'package:flutter/material.dart';
import 'package:flutter_sqlite/pages/Dashboard/top.dart';
import 'package:flutter_sqlite/pages/explore/explore.dart';

void main() => runApp(Dash());

class Dash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(17, 34, 63, 1),
          title: Text("Dashboard"),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => explore()));
                })
          ],
        ),
        body: HomePage(),
      ),
    );
  }
}
