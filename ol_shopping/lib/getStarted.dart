import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:olshopping/Auth/signin.dart';
import 'package:olshopping/home.dart';
import 'package:page_transition/page_transition.dart';

class LandingScreen extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<LandingScreen>
    with SingleTickerProviderStateMixin {
  Color _color1 = Color(0xFF36BA7A);
  Color _color2 = Colors.white;

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
    final double _width = MediaQuery.of(context).size.width;
    controller.forward();
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            backgroundColor: Color(0xFF36BA7A),
            body: ListView(
              children: <Widget>[
                Transform(
                    transform: Matrix4.translationValues(
                        0, bottomAnimation1.value * _height, 0),
                    child: buildNameColumn()),
              ],
            ),
          );
        });
  }

  Column buildNameColumn() {
    final double _height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Center(
          child: Column(children: [
            Container(
                margin: EdgeInsets.only(top: 80),
                child: Image.network(
                  'http://clipart-library.com/new_gallery/332-3325704_eyes-cartoon-eyes-and-mouth.png',
                  height: 100,
                )),
            SizedBox(
              height: 1,
            ),
            Container(
              child: RichText(
                text: TextSpan(
                  text: 'Pho',
                  style: TextStyle(color: Colors.white,fontSize: 30),
                  /*defining default style is optional */
                  children: <TextSpan>[
                    TextSpan(
                        text: 'to',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: 'Graphy',
                        style: TextStyle(color: Colors.lightGreenAccent)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 132,
            ),
            Container(
              width: double.infinity,
              height: 380,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(0),
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(0)),
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
                            padding: EdgeInsets.only(right: 160),
                            child: Column(children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Smart',
                                  style: TextStyle(color: Colors.yellow[600],fontSize: 26),
                                  /*defining default style is optional */
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' way of',
                                        style: TextStyle(fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Text("Photography",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.teal)),
                            ]),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.network(
                                'http://clipart-library.com/new_gallery/15-156384_old-camera-png-camera-drawing-transparent-background.png',
                                height: 200,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          30) ////                <--- border radius here
                                      ),
                                ),
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyLoginPage()),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Take a tour",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
