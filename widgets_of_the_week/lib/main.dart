import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//https://fluttercentral.com/Articles/Post/1207/AnimatedSwitcher_Widget_Example_in_Flutter

void main() => runApp(LogoApp());

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> {
  List<String> name = ['S', 'H', 'U', 'B', 'H', 'A', 'N', 'G', 'I'];
  Widget _myAnimatedWidget = FirstWidget();
  double padValue = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Widgets Demo"),
          ),
          body: Column(
            children: <Widget>[
              Container(
                height: 100,
                width: 200,
                child: AnimatedPadding(
                  child: Container(
                    color: Colors.red,
                  ),
                  duration: const Duration(seconds: 1),
                  padding: EdgeInsets.all(padValue),
                  curve: Curves.easeInOut,
                ),
              ),
              Text('Padding Value: $padValue'),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Add Padding"),
                    onPressed: () {
                      setState(() {
                        padValue = padValue + 10;
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text("Remove Padding"),
                    onPressed: () {
                      setState(() {
                        if (padValue != 0) padValue = padValue - 10;
                      });
                    },
                  )
                ],
              ),
              Container(
                child: AnimatedPadding(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.all(0),
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                child: AnimatedSwitcher(
                  duration: const Duration(seconds: 2),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(child: child, scale: animation);
                  },
                  child: _myAnimatedWidget,
                ),
              ),
              RaisedButton(
                child: Text('Click here'),
                onPressed: () {
                  setState(() {
                    _myAnimatedWidget =
                        (_myAnimatedWidget.toString() == "FirstWidget")
                            ? SecondWidget()
                            : FirstWidget();
                  });
                },
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: 50,
                    maxHeight: 100,
                    maxWidth: 200,
                    minWidth: 200),
                child: RaisedButton(
                  child: Text('Tap Me'),
                ),
              )
            ],
          )),
    );
  }
}

class FirstWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      child: Center(child: Text("This is First Widget")),
      decoration: BoxDecoration(
        color: Colors.orange,
      ),
    );
  }
}

class SecondWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      child: Center(child: Text("This is Second Widget")),
      decoration: BoxDecoration(
        color: Colors.green,
      ),
    );
  }
}
