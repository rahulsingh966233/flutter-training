import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  void playSound(int musicFileNumber) {
    final player = AudioCache();
    player.play('note$musicFileNumber.wav');
  }

  Expanded buildKey({Color colorName, int musicNumber}){
    return Expanded(
      child: FlatButton(
        color: colorName,
        onPressed: () {
          playSound(musicNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(Colors.red, 1);
              buildKey(Colors.orange, 2);
              buildKey(Colors.green,3);
              buildKey(Colors.purple,4);
              buildKey(Colors.blue,5);
              buildKey(Colors.yellow,6);
              buildKey(Colors.brown,7);
            ],
          ),
        ),
      ),
    );
  }
}
