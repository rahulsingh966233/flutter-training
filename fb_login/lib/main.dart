import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

//https://www.youtube.com/watch?v=r6AfIOONYoM

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isLoggedIn = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser myUser;

  Future<FirebaseUser> _signInWithFacebook() async {
    var fbLogin = new FacebookLogin();
    var result = await fbLogin.logIn(['email']);
    debugPrint(result.status.toString());

    if (result.status == FacebookLoginStatus.loggedIn) {
      AuthCredential credential = FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token);
      FirebaseUser firebaseUser =
          (await FirebaseAuth.instance.signInWithCredential(credential)).user;
      return firebaseUser;
    }
    return null;
  }

  void _logIn() {
    _signInWithFacebook().then((value) {
      if (value != null) {
        myUser = value;
        isLoggedIn = true;
        setState(() {});
      }
    });
  }

  void _logOut() async {
    await _auth.signOut().then((value) {
      isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoggedIn ? Text('Prof Page') : Text("Shbh"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: _logOut,
          )
        ],
      ),
      body: Center(
        child: isLoggedIn
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Name: ' + myUser.displayName),
                  Image.network(myUser.photoUrl),
                  Text('Phone Number: ' +
                      (myUser.phoneNumber != null
                          ? myUser.phoneNumber
                          : 'Not available'))
                ],
              )
            : FacebookSignInButton(
                onPressed: _logIn,
              ),
      ),
    );
  }
}
