import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  void playSound(){
    final player = AudioCache();
    player.play('note2.wav');
  }

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
                  playSound();
                },
              ),
              FlatButton(
                color: Colors.green,
                onPressed: () {
                  playSound();
                },
                child: Text('Click Me'),
              ),
              FlatButton(
                color: Colors.yellow,
                onPressed: () {
                  playSound();
                },
              ),
              FlatButton(
                color: Colors.blue,
                onPressed: () {
                  playSound();
                },
              ),
              FlatButton(
                color: Colors.grey,
                onPressed: () {
                  playSound();
                },
              ),
              FlatButton(
                color: Colors.purple,
                onPressed: () {
                  playSound();
                },
              ),
              FlatButton(
                color: Colors.orange,
                onPressed: () {
                  playSound();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
