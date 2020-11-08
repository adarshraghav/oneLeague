import 'package:flutter/material.dart';
import 'package:flutter_sqlite/pages/Dashboard/top.dart';

void main() => runApp(Dash());

class Dash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Dashboard"),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: null)
          ],
        ),
        body: HomePage(),
      ),
    );
  }
}
