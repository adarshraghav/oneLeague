import 'dart:html';

import 'package:dashboard/Screens/Firstscreen/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter dashboard',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
