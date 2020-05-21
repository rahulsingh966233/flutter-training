import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              FlatButton(
                color: Colors.red,
                onPressed: () {
                  final player = AudioCache();
                  player.play('note1.wav');
                },
              ),
              FlatButton(
                onPressed: () {
                  final player = AudioCache();
                  player.play('note2.wav');
                },
                child: Text('Click Me'),
              ),
              FlatButton(
                onPressed: () {
                  final player = AudioCache();
                  player.play('note3.wav');
                },
              ),
              FlatButton(
                onPressed: () {
                  final player = AudioCache();
                  player.play('note4.wav');
                },
              ),
              FlatButton(
                onPressed: () {
                  final player = AudioCache();
                  player.play('note5.wav');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
