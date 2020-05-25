import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//https://medium.com/@adp4infotech4/flutter-building-a-reorderable-listview-735013719cf3

void main() => runApp(LogoApp());

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> {
  List<String> name = ['S', 'H', 'U', 'B', 'H', 'A', 'N', 'G', 'I'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Container(
                height: 500,
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
                height: 100,
              ),
            ],
          )),
    );
  }
}