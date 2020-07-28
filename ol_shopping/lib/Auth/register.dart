import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:olshopping/Auth/signin.dart';
import 'package:olshopping/detail.dart';
import 'package:olshopping/home.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final databaseReference = Firestore.instance;

class MyRegisterPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<MyRegisterPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation topAnimation1,
      topAnimation2,
      topAnimation3,
      bottomAnimation1,
      bottomAnimation2,
      bottomAnimation3,
      sideAnimation1,
      sideAnimation2;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    topAnimation1 = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(.5, 1.0, curve: Curves.fastOutSlowIn)));

    topAnimation2 = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(.7, 1.0, curve: Curves.fastOutSlowIn)));

    topAnimation3 = Tween(begin: -1.0, end: 0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(.9, 1.0, curve: Curves.fastOutSlowIn)));

    bottomAnimation1 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(.5, 1.0, curve: Curves.fastOutSlowIn)));

    bottomAnimation2 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(.7, 1.0, curve: Curves.fastOutSlowIn)));

    bottomAnimation3 = Tween(begin: 1.0, end: 0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(.9, 1.0, curve: Curves.fastOutSlowIn)));

    sideAnimation1 = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.bounceInOut));

    sideAnimation2 = Tween(begin: 1.0, end: 0).animate(
        CurvedAnimation(parent: controller, curve: Curves.bounceInOut));
  }

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;

    controller.forward();
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            backgroundColor: Color(0xFF36BA7A),
            body: ListView(
              shrinkWrap: true,
              children: <Widget>[
//                SizedBox(height: 20),
                Transform(
                    transform: Matrix4.translationValues(
                        0, topAnimation2.value * _height, 0),
                    child: buildNameColumn()),
                SizedBox(height: 20),
              ],
            ),
          );
        });
  }

  Column buildNameColumn() {
    var alertStyle = AlertStyle(
        animationType: AnimationType.fromTop,
        isCloseButton: false,
        isOverlayTapDismiss: false,
        descStyle: TextStyle(fontWeight: FontWeight.bold),
        animationDuration: Duration(milliseconds: 400),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: BorderSide(
            color: Colors.grey,
          ),
        ),
        titleStyle: TextStyle(
          color: Colors.red,
        ),
        constraints: BoxConstraints.expand(width: 300));
    final contactController = TextEditingController();
    final _otpCOntrolled = TextEditingController();
    var myOTP = 0;
    String numberOTP = '0';

    Future<Map<String, dynamic>> createRecord() async {
      int min = 100000;
      int max = 999999;
      var randomizer = new Random();
      myOTP = min + randomizer.nextInt(max - min);
      print("$myOTP");

      await databaseReference.collection("users").add({
        'email': "abc@gmail.com",
        'number': contactController.text,
        'otp': "$myOTP",
        'isVerified': false
      });
      Map<String, String> headers = {
        'authkey': '103299AEyJzOU6HQi5f0820d2P1',
        'Content-Type': 'application/json'
      };
      final msg = jsonEncode({
        "mobiles": contactController.text,
        "flow_id": "5f168b0dd6fc053e373398e5",
        "otp": "$myOTP",
        "sender": "SMSIND",
        "unicode": 0
      });

      var response = await http.post(
        'https://api.msg91.com/api/v5/flow/',
        headers: headers,
        body: msg,
      );
      print(response.body);
      if(response.body != null){
        Alert(
          context: context,
          style: alertStyle,
          type: AlertType.info,
          title: "Success",
          desc: "OTP sent!!",
          buttons: [
            DialogButton(
              child: Text(
                "COOL",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              color: Color.fromRGBO(0, 179, 134, 1.0),
              radius: BorderRadius.circular(0.0),
            ),
          ],
        ).show();
      }
    }

    return Column(
      children: <Widget>[
        Center(
          child: Container(
//            width: 300,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(50)),
                  side: BorderSide(width: 2, color: Colors.white)),
              elevation: 7,
              child: Column(children: [
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(height: 35),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 25),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle,
                                    color: Colors.black),
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 14),
                                fillColor: Colors.black),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_circle,
                                    color: Colors.black),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 14),
                                fillColor: Colors.black),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.security, color: Colors.black),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 14),
                                fillColor: Colors.black),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.security, color: Colors.black),
                                labelText: 'Confirm Password',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 14),
                                fillColor: Colors.black),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: contactController,
                            decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.security, color: Colors.black),
                                labelText: 'Contact Number',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 14),
                                fillColor: Colors.black),
                          ),
                        ),
                        TextField(
                          controller: _otpCOntrolled,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.security, color: Colors.black),
                              labelText: 'OTP',
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 14),
                              fillColor: Colors.black),
                        ),
                        RaisedButton(
                          color: Colors.yellow,
                          child: Text("SubmitOTP"),
                          onPressed: () {
                            print(_otpCOntrolled.text);
                            print("$myOTP");
                            print(_otpCOntrolled.text == "$myOTP");
                            _otpCOntrolled.text == "$myOTP"
                                ? Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.upToDown,
                                        child: MyApp()))
                                : Alert(
                                    context: context,
                                    style: alertStyle,
                                    type: AlertType.info,
                                    title: "ALERT",
                                    desc: "Sorry, wrong OTP",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "COOL",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        color: Color.fromRGBO(0, 179, 134, 1.0),
                                        radius: BorderRadius.circular(0.0),
                                      ),
                                    ],
                                  ).show();
                          },
                        ),
                        SizedBox(height: 25),
                        FloatingActionButton(
                          onPressed: createRecord,
                          backgroundColor: Color(0xFF36BA7A),
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                        SizedBox(height: 25),
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
        SizedBox(
          height: 60,
        ),
        Image.network(
          'http://clipart-library.com/new_gallery/332-3325704_eyes-cartoon-eyes-and-mouth.png',
          height: 140,
        )
      ],
    );
  }
}
