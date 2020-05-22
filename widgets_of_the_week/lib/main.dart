import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Wrap(
            alignment: WrapAlignment.end,
            spacing: 10.0,
            runSpacing: 20.0,
            children: [
              Chip(
                avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('AH')),
                label: Text('Hamilton'),
              ),
              Chip(
                avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: Text('ML')),
                label: Text('Lafayette'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
