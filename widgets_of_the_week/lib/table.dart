import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: TableWidgetDemo(),
    title: 'DummyApp',
    debugShowCheckedModeBanner: false,
  ));
}

class TableWidgetDemo extends StatefulWidget {
  @override
  _TableWidgetDemoState createState() => _TableWidgetDemoState();
}

class _TableWidgetDemoState extends State<TableWidgetDemo> {
  double iconSize =20;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Table(
          border: TableBorder.all(),
          children: [
            TableRow(children: [
              Column(
                children: [
                  Icon(
                    Icons.account_box,
                    size: iconSize,
                  ),
                  Text('MyAcc'),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.settings,
                    size: iconSize,
                  ),
                  Text('Setting'),
                ],
              ),
              Column(children: [
                Icon(
                  Icons.lightbulb_outline,
                  size: iconSize,
                ),
                Text('Ideas')
              ]),
            ]),

            TableRow( children: [
              Column(children: [
                Icon(Icons.cake, size: iconSize,),
              ],),
              Column(children: [
                Icon(Icons.voice_chat, size: iconSize,),
              ],),
              Column(children: [
                Icon(Icons.add_location, size: iconSize,),
                Text("Loc")
              ],)
            ]),
          ],
        ),
      ),
    );
  }
}
