import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(WidgetOfTheWeek());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double iconSize = 20;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Table'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                child: Table(
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
                    TableRow(children: [
                     Column(
                       children: [
                         Icon(
                           Icons.send,
                           size: iconSize,
                         )
                       ],
                     )
                    ])
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetOfTheWeek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Wrap(
            alignment: WrapAlignment.end,
            spacing: 10.0,
            runSpacing: 20.0,
            children: [
              Chip(
                avatar: CircleAvatar(
                    backgroundColor: Colors.blue.shade900, child: Text('AH')),
                label: Text('Hamilton'),
              ),
              Chip(
                avatar: CircleAvatar(
                    backgroundColor: Colors.blue.shade900, child: Text('ML')),
                label: Text('Lafayette'),
              ),
//              FutureBuilder(
//                  future:
//                      http.get('https://jsonplaceholder.typicode.com/todos'),
//                  builder: (context, snapshot) {
//                    if (snapshot.connectionState == ConnectionState.done) {
//                      return Text('Data Got');
//                    } else {
//                      return CircularProgressIndicator();
//                    }
//                  }),
//              FadeTransition(
//                opacity: null,
//                child: Text('Sh'),
//              )
//              Scaffold(
//                  floatingActionButton: FloatingActionButton(
//                child: Icon(Icons.add),
//                onPressed: () {},
//              )
//              )
            ],
          ),
        ),
      ),
    );
  }
}
