import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:olshopping/Auth/loginArt/bezierContainer.dart';
import 'package:olshopping/Auth/register.dart';
import 'package:olshopping/grid.dart';
import 'package:olshopping/main.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(ForgotPasswordPage());
}

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<ForgotPasswordPage> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _hasFingerPrintSupport = false;
  String _authorizedOrNot = "Not Authorized";
  List<BiometricType> _availableBuimetricType = List<BiometricType>();

  Future<void> _getBiometricsSupport() async {
    bool hasFingerPrintSupport = false;
    try {
      hasFingerPrintSupport = await _localAuthentication.canCheckBiometrics;
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _hasFingerPrintSupport = hasFingerPrintSupport;
    });
  }

  Future<void> _getAvailableSupport() async {
    List<BiometricType> availableBuimetricType = List<BiometricType>();
    try {
      availableBuimetricType =
      await _localAuthentication.getAvailableBiometrics();
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _availableBuimetricType = availableBuimetricType;
    });
  }

  Future<void> _authenticateMe() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason: "Authenticate for Testing", // message for dialog
        useErrorDialogs: true, // show error in dialog
        stickyAuth: true, // native process
      );
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _authorizedOrNot = authenticated ? "Authorized" : "Not Authorized";
    });
  }

  @override
  void initState() {
    _getBiometricsSupport();
    _getAvailableSupport();
    super.initState();
  }

//  Widget _backButton() {
//    return InkWell(
//      onTap: () {
//        Navigator.pop(context);
//      },
//      child: Container(
//        padding: EdgeInsets.symmetric(horizontal: 10),
//        child: Row(
//          children: <Widget>[
//            Container(
//              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
//              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
//            ),
//            Text('Back',
//                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
//          ],
//        ),
//      ),
//    );
//  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true)),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFFB2DFDB), Color(0xFF4DB6AC)])),
      child: Text(
        'Submit',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 2.0, color: Colors.teal.shade600),
            bottom: BorderSide(width: 2.0, color: Colors.teal.shade900),
            left: BorderSide(width: 2.0, color: Colors.lightBlue.shade900),
            right: BorderSide(width: 2.0, color: Colors.lightBlue.shade900),
          ),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.fingerprint,
                  color: Colors.teal.shade600,
                  size: 30,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: RaisedButton(
                  child: Text(
                    "     Login with Fingerprint      ",
                    style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  color: Colors.white,
                  onPressed: _authenticateMe,
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
//        Navigator.push(
//            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              child: Text(
                'Register',
                style: TextStyle(
                    color: Color(0xFF4DB6AC),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.upToDown,
                        child: MyRegisterPage()));
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'For',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xFF4DB6AC),
          ),
          children: [
            TextSpan(
              text: 'get',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: ' Pass',
              style: TextStyle(color: Color(0xFF4DB6AC), fontSize: 30),
            ),
            TextSpan(
              text: 'word',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email id"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = 500;
    return MaterialApp(
        home: Scaffold(
            body: Container(
              height: 800,
              child: Stack(
                children: <Widget>[
                  Positioned(top: 5, left: 200, child: BezierContainer()),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: height * .2),
                          _title(),
                          SizedBox(height: 130),
                          SizedBox(height: 50),
                          _emailPasswordWidget(),
                          SizedBox(height: 20),
                          _submitButton(),
                          SizedBox(height: height * .055),
                        ],
                      ),
                    ),
                  ),

//              Positioned(top: 40, left: 0, child: _backButton()),
                ],
              ),
            )));
  }
}
