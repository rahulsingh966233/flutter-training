import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:sddemo/main.dart';

class HomePage extends StatefulWidget {
  var userProf;
  final String social_media;

  HomePage({Key key, @required this.userProf, @required this.social_media})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoggedIn = true;

  final facebookLogin = FacebookLogin();

  _logout() async {
    await facebookLogin.logOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Home");
    return _isLoggedIn
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network(
                widget.social_media == 'facebook'
                    ? widget.userProf["picture"]["data"]["url"]
                    : widget.userProf.photoUrl,
                height: 50.0,
                width: 50.0,
              ),
              Text(widget.social_media == 'facebook'
                  ? widget.userProf["name"]
                  : widget.userProf.displayName),
              OutlineButton(
                child: Text("LogOut"),
                onPressed: _logout,
              )
            ],
          )
        : MyApp();
  }
}
