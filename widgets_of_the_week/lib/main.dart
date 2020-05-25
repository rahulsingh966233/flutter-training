import 'dart:math';
import 'package:flutter/material.dart';

//https://fluttercentral.com/Articles/Post/1213/LimitedBox_widget_example_in_Flutter

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
        body:  ListView.builder(itemBuilder: (BuildContext context, int i){
          return LimitedBox(
            maxHeight: 60,
              child: Container(
                color: UniqueColorGenerator.getColor(),
              ),
          );
        })
      ),
    );
  }
}
class UniqueColorGenerator{
  static Random random = new Random();
  static Color getColor(){
    return Color.fromARGB(255, random.nextInt(255), 
        random.nextInt(255), random.nextInt(255));
  }
}
