import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DataTableWidgetDemo(),
    title: 'DummyApp',
    debugShowCheckedModeBanner: false,
  ));
}

class DataTableWidgetDemo extends StatefulWidget {
  @override
  _DataTableWidgetDemoState createState() => _DataTableWidgetDemoState();
}

class _DataTableWidgetDemoState extends State<DataTableWidgetDemo> {
  double iconSize = 20;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: ListView(
        children: <Widget>[
          Center(
            child: Text(
              'Students',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          DataTable(
            columns: [
              DataColumn(label: Text('RollNo')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Class')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Shubh')),
                DataCell(Text('A')),
              ]),
              DataRow(cells: [
                DataCell(Text('12')),
                DataCell(Text('John')),
                DataCell(Text('9')),
              ]),
              DataRow(cells: [
                DataCell(Text('42')),
                DataCell(Text('Tony')),
                DataCell(Text('8')),
              ]),
            ],
          )
        ],
      )),
    );
  }
}
