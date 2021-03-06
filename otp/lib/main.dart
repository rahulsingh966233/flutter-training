import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:http/http.dart' as http;

final databaseReference = Firestore.instance;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _otpCOntrolled = TextEditingController();
  var numberOTP = '0';

  Future<Map<String, dynamic>> createRecord() async {
    int min = 100000;
    int max = 999999;
    var randomizer = new Random();
    var rNum = min + randomizer.nextInt(max - min);
    print(rNum);
    setState(() {
      numberOTP = "$rNum";
    });
    DocumentReference ref = await databaseReference.collection("users").add({
      'email': _emailController.text,
      'number': _phoneNumberController.text,
      'otp': rNum,
      'isVerified': false
    });
    Map<String, String> headers = {
      'authkey': '103299AEyJzOU6HQi5f0820d2P1',
      'Content-Type': 'application/json'
    };
    final msg = jsonEncode({
      "mobiles": _phoneNumberController.text,
      "flow_id": "5f168b0dd6fc053e373398e5",
      "otp": "$rNum",
      "sender": "SMSIND",
      "unicode": 0
    });

    var response = await http.post(
      'https://api.msg91.com/api/v5/flow/',
      headers: headers,
      body: msg,
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration.collapsed(hintText: 'Email'),
              ),
            ),
            Flexible(
              child: TextField(
                controller: _phoneNumberController,
                decoration: InputDecoration.collapsed(hintText: 'Number'),
              ),
            ),
            Flexible(
              child: TextField(
                controller: _otpCOntrolled,
                decoration: InputDecoration.collapsed(hintText: 'OTP'),
              ),
            ),
            FloatingActionButton(
              onPressed: (){
                print(_otpCOntrolled.text);
                print(numberOTP);
                print(_otpCOntrolled.text == numberOTP);
                _otpCOntrolled.text == numberOTP ? print("Correct") : print("wrong");
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createRecord,
        child: Text("Send"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
