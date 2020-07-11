import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

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
  bool _isComposing = false;

  Future<void> createRecord() async {
    int min = 100000;
    int max = 999999;
    var randomizer = new Random();
    var rNum = min + randomizer.nextInt(max - min);
    DocumentReference ref = await databaseReference.collection("users").add({
      'email': _emailController.text,
      'number': _phoneNumberController.text,
      'otp': rNum,
      'isVerified': false
    });
    print(ref.documentID);
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createRecord,
        child: Text("Submit"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
