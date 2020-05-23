import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xylophone/DataTableDemo.dart';
import 'package:xylophone/table.dart';

void main() => runApp(WidgetOfTheWeek());


class WidgetOfTheWeek extends StatefulWidget {
  @override
  _WidgetOfTheWeekState createState() => _WidgetOfTheWeekState();
}

class _WidgetOfTheWeekState extends State<WidgetOfTheWeek> {
  double iconSize = 20;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Table'),
        ),
        body: Center(
          child: Container(
              margin: EdgeInsets.all(20),
              child: Row(children: [
                FlatButton(
                  textColor: Colors.blue,
                  child: Text(
                    'Table',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TableWidgetDemo()));
                  },
                ),
                FlatButton(
                  textColor: Colors.blue,
                  child: Text(
                    'Data Table',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DataTableWidgetDemo()));
                  },
                )
              ],)
          )
        ),
      ),
    );
  }
}
