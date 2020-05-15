import 'package:flutter/material.dart';

// The main function to start out flutter app
void main() {
  runApp(MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            title: Text('Im Rich'),
            backgroundColor: Colors.blueGrey[900],
          ),
          body: Center(
            child: Image(
              image: AssetImage(
                  'images/download.jpeg'),
            ),
          )
          )
          )
          );
}
