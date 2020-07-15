import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olshopping/Auth/register.dart';
import 'package:olshopping/Auth/widget/form_box.dart';
import 'package:page_transition/page_transition.dart';
import 'package:local_auth/local_auth.dart';

void main() {
  runApp(MyLoginPage());
}

class MyLoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<MyLoginPage>
    with SingleTickerProviderStateMixin {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _hasFingerPrintSupport = false;
  String _authorizedOrNot = "Not Authorized";
  List<BiometricType> _availableBuimetricType = List<BiometricType>();
  AnimationController animationController;
  Animation animation1, animation2, animation3;

  Future<void> _getBiometricsSupport() async {
    // 6. this method checks whether your device has biometric support or not
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
    // 7. this method fetches all the available biometric supports of the device
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
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation1 = Tween(begin: -1.0, end: 0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.bounceInOut));

    animation2 = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(.50, 1.0, curve: Curves.fastOutSlowIn)));

    animation3 = Tween(begin: 1.0, end: 0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(.8, 1.0, curve: Curves.fastOutSlowIn)));
  }

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            backgroundColor: Color(0xFF36BA7A),
            body: ListView(
              shrinkWrap: true,
              children: <Widget>[
                SizedBox(height: _height * 0.10),
                Transform(
                  transform: Matrix4.translationValues(
                      0, animation2.value * _height, 0),
                  child: Image.network(
                    'http://clipart-library.com/new_gallery/332-3325704_eyes-cartoon-eyes-and-mouth.png',
                    height: 100,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      animation2.value * _width, 0, 0),
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(100),
                              topRight: Radius.circular(100),
                              bottomLeft: Radius.circular(0)),
                          side: BorderSide(width: 2, color: Colors.white)),
                      elevation: 7,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: _width * 0.15, right: _width * 0.15),
                        height: 300,
                        child: FormBox(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 2,
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      animation1.value * _width, 0, 0),
                  child: Container(
                    margin: EdgeInsets.only(
                        left: _width * 0.12, right: _width * 0.15),
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 15,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(
                                      30) ////                <--- border radius here
                                  ),
                            ),
                            child: FlatButton(
                              onPressed: _authenticateMe,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.fingerprint,
                                    size: 40,
                                    color: Color(0xFF36BA7A),
                                  ),
                                  Text(
                                    "Sign In with Fingerprint",
                                    style: TextStyle(color: Color(0xFF36BA7A)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Transform(
                  transform: Matrix4.translationValues(
                      0, animation3.value * _height, 0),
                  child: buildText(),
                ),
                SizedBox(height: 30),
              ],
            ),
          );
        });
  }

  Widget buildText() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyRegisterPage()),
        );
      },
      child: Text.rich(
        TextSpan(
          text: 'Do not have an account? ',
          style: TextStyle(fontFamily: 'Quicksand'),
          children: <TextSpan>[
            TextSpan(
                text: 'Signup',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                )),
            // can add more TextSpans here...
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
