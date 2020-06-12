import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signin/LoginProvider.dart';
import 'package:signin/Loginpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginProvider(
      child: MaterialApp(
        title: 'Login App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}
