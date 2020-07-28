import 'dart:math';

import 'package:flutter/material.dart';
import 'package:olshopping/home.dart';
import 'package:page_transition/page_transition.dart';


class FormBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildStack(context),
    );
  }

  Widget buildStack(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(color: Color(0xFF36BA7A), height: 0),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.only(right: 130),
              child: Text(
                'Login',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.only(left: 0, right: 0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle, color: Colors.black),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 14),
                    fillColor: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 0, right: 0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.security, color: Colors.black),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 14),
                    fillColor: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 130),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.upToDown, child: MyApp()));
                },
                backgroundColor: Color(0xFF36BA7A),
                child: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
