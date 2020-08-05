import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'package:sddemo/Home.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  String gName;
  String gProf;
  String social_media_type = '';
  final facebookLogin = FacebookLogin();
  GoogleSignInAccount _currentUser;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>['email'],
  );

  _loginWithSocial(type) async {
    if (type == 'google') {
      try {
        await _googleSignIn.signIn();
        setState(() {
          social_media_type = type;
          _isLoggedIn = true;
        });
      } catch (err) {
        print(err);
      }
    }
    if (type == 'facebook') {
      final result = await facebookLogin.logIn(['email']);
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          final token = result.accessToken.token;
          final graphResponse = await http.get(
              'https://graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),first_name,last_name,email&access_token=${token}');
          final profile = json.decode(graphResponse.body);
          setState(() {
            social_media_type = type;
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
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: _isLoggedIn
              ? HomePage(
                  social_media: social_media_type,
                  userProf: social_media_type == 'facebook'
                      ? userProfile
                      : _googleSignIn.currentUser,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: OutlineButton(
                        textColor: Colors.blue,
                        child: Text("Login with Facebook",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        onPressed: () => _loginWithSocial('facebook'),
                      ),
                    ),
                    Center(
                      child: OutlineButton(
                        textColor: Colors.red[800],
                        child: Text(
                          "Login with Google",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () => _loginWithSocial('google'),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
