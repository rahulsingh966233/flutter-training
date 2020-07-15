import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:olshopping/Auth/signin.dart';
import 'package:olshopping/home.dart';
import 'package:page_transition/page_transition.dart';

class MyRegisterPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<MyRegisterPage>
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
    final double _height = MediaQuery.of(context).size.height;
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
                      bottomLeft:Radius.circular(50)),
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
                                prefixIcon:
                                    Icon(Icons.account_circle, color: Colors.black),
                                labelText: 'Name',
                                labelStyle:
                                    TextStyle(color: Colors.black, fontSize: 14),
                                fillColor: Colors.black),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.account_circle, color: Colors.black),
                                labelText: 'Email',
                                labelStyle:
                                    TextStyle(color: Colors.black, fontSize: 14),
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
                                labelStyle:
                                    TextStyle(color: Colors.black, fontSize: 14),
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
                                labelStyle:
                                    TextStyle(color: Colors.black, fontSize: 14),
                                fillColor: Colors.black),
                          ),
                        ),
                        SizedBox(height: 25),
                        Positioned(
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.upToDown,
                                      child: MyLoginPage()));
                            },
                            backgroundColor: Color(0xFF36BA7A),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
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
        SizedBox(height: 60,),
        Image.network(
          'http://clipart-library.com/new_gallery/332-3325704_eyes-cartoon-eyes-and-mouth.png',
          height: 140,
        )
      ],
    );
    
  }
}
