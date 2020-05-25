import 'dart:math';
import 'package:flutter/material.dart';

//https://medium.com/flutteropen/flutter-widgets-10-placeholder-f8949a7dc273

void main() => runApp(LogoApp());

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> {
  final length = 10;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Container(
            height: 100,
            child: Placeholder(
              color: Colors.green,
              strokeWidth: 10,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            constraints: BoxConstraints.expand(height: 100, width: 100),
            child: Placeholder(
              color: Colors.blue,
              strokeWidth: 4,
              fallbackWidth: 10,
              fallbackHeight: 60,
            ),
          ),
        ],
      )),
    );
  }
}
