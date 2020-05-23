import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'MediaQuery Demo',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return new Container(
      child: Row(
        children: <Widget>[
          Container(color: Colors.red, child: Text("Left")),
          Spacer(),
          Container(color: Colors.red, child: Text("Right")),
        ],
      ),
    );
  }
}