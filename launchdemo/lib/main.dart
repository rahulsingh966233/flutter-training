import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  launchURL() {
    launch('https://flutter.dev');
  }

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Counter Value: 0", style: TextStyle(fontSize: 20),),
        RaisedButton(
          child: Text("increment"),
          onPressed: () {

          },
        ),
        RaisedButton(
          child: Text("decrement"),
          onPressed: () {},
        ),
      ],
    );
  }
}
