import 'package:flutter/material.dart';
import 'package:xylophone/sizes_helpers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sizes... sizes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Sizes... sizes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    print('Size = ' + MediaQuery.of(context).size.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.red,
              width: displayWidth(context) * 0.5,
              height: displayHeight(context) -
                  MediaQuery.of(context).padding.top -
                  kToolbarHeight,
              child: Text(
                'Box width 50% of screen width and text size 6% of screen width and full s'
                    'creen height minus status bar height and AppBar height',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: displayWidth(context) * 0.06),
              ),
            ),
          ],
        ),
      ),
    );
  }
}