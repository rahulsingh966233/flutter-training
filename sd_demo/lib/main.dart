import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();

  _loginWithFacebook() async {
    final result = await facebookLogin.logIn(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),first_name,last_name,email&access_token=${token}');
        final profile = json.decode(graphResponse.body);
        setState(() {
          userProfile = profile;
          _isLoggedIn = true;
        });
        break;
      case FacebookLoginStatus.cancelledByUser:
        setState(() {
          _isLoggedIn = false;
        });
        break;
      case FacebookLoginStatus.error:
        setState(() {
          _isLoggedIn = false;
        });
        break;
    }
  }

  _logout() async {
    await facebookLogin.logOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: _isLoggedIn
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    userProfile["picture"]["data"]["url"],
                    height: 50.0,
                    width: 50.0,
                  ),
                  Text(userProfile["name"]),
                  OutlineButton(
                    child: Text("LogOut"),
                    onPressed: _logout,
                  )
                ],
              )
              : Center(
                  child: OutlineButton(
                    color: Colors.blue,
                    child: Text("Login with Facebook"),
                    onPressed: _loginWithFacebook,
                  ),
                ),
        ),
      ),
    );
  }
}
