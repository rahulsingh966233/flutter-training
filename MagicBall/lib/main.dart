import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      setting up the background color of screen body
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
//        background color for heading-Appbar
        backgroundColor: Colors.blue[900],
//        set title
        title: Text('Ask Me Anything'),
      ),
      body: Container(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;

  void _handleSubmitted(int number) {
//    setting up the state of ball Number dynamically
    setState(() {
      ballNumber = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          child: FlatButton(
              onPressed: () => _handleSubmitted(Random().nextInt(5) + 1),
//              For dynamic implemetaion of image on CLick
              child: Image.asset('images/ball$ballNumber.png')),
        ),
      ),
    );
  }
}


