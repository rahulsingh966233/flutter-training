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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                height: 200,
                child: ReorderableListView(
                  onReorder: (oldIndex, newIndex) {
                    setState(
                          () {
                        if (newIndex > oldIndex) {
                          newIndex -= 1;
                        }
                        final String item = name.removeAt(oldIndex);
                        name.insert(newIndex, item);
                      },
                    );
                  },
                  children: [
                    for(var item in name)
                      ListTile(
                          key: ValueKey(item),
                          title: Text('Item#$item')
                      )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                child: AnimatedSwitcher(
                  duration: const Duration(seconds: 2),
                  transitionBuilder: (Widget child, Animation<double> animation) {
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