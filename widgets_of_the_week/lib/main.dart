import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

//https://fluttercentral.com/Articles/Post/1207/AnimatedSwitcher_Widget_Example_in_Flutter

void main() => runApp(LogoApp());

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> {
  List<String> name = ['S', 'H', 'U', 'B', 'H', 'A', 'N', 'G', 'I'];
  Widget _myAnimatedWidget = FirstWidget();
  double padValue = 0;
  double _ironManAlignment = 50;
  double opacityLevel = 1.0;
  bool _first = true;

  double _left = 20;
  double _top = 20;
  double _right = 20;
  double _bottom = 20;
  int _index = 0;
  double rating = 1;
  var selectedRange = RangeValues(0.2, 0.8);
  bool isUser = false;
  List<bool> _selectOptions = List.generate(4, (_) => false);

  final FixedExtentScrollController _controller = FixedExtentScrollController();
  bool _checked = false;
  List<Widget> listtiles = [
    ListTile(
      leading: Icon(Icons.portrait),
      title: Text("Portrait"),
      subtitle: Text("Beautiful View..!"),
      trailing: Icon(Icons.arrow_forward_ios),
    ),
    ListTile(
      leading: Icon(Icons.landscape),
      title: Text("LandScape"),
      subtitle: Text("Beautiful View..!"),
      trailing: Icon(Icons.remove),
    ),
    ListTile(
      leading: Icon(Icons.map),
      title: Text("Map"),
      subtitle: Text("Map View..!"),
      trailing: Icon(Icons.wb_sunny),
    ),
    ListTile(
      leading: Icon(Icons.landscape),
      title: Text("LandScape"),
      subtitle: Text("Wonderful View..!"),
      trailing: Icon(Icons.wb_sunny),
    ),
    ListTile(
      leading: Icon(Icons.list),
      title: Text("List Example"),
      subtitle: Text("List Wheel Scroll view .!"),
      trailing: Icon(Icons.cloud),
    ),
    ListTile(
      leading: Icon(Icons.settings),
      title: Text("Settings"),
      subtitle: Text("Change the setting..!"),
      trailing: Icon(Icons.portrait),
    ),
    ListTile(
      leading: Icon(Icons.event),
      title: Text("Add data"),
      subtitle: Text("Data View..!"),
      trailing: Icon(Icons.add),
    ),
    ListTile(
      leading: Icon(Icons.landscape),
      title: Text("LandScape"),
      subtitle: Text("Beautiful View..!"),
      trailing: Icon(Icons.wb_sunny),
    ),
    ListTile(
      leading: Icon(Icons.email),
      title: Text("Email"),
      subtitle: Text("Check Email..!"),
      trailing: Icon(Icons.arrow_forward),
    ),
    ListTile(
      leading: Icon(Icons.games),
      title: Text("Games"),
      subtitle: Text("Play Games..!"),
      trailing: Icon(Icons.zoom_out_map),
    ),
  ];

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(text: 'Cat'),
                    Tab(text: 'Dog'),
                    Tab(text: 'Rabbit'),
                    
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  Image.network('https://cdn.pixabay.com/photo/2014/11/30/14/11/kitty-551554__340.jpg'),
                  Image.network('https://static.toiimg.com/thumb/msid-60132235,imgsize-169468,width-800,height-600,resizemode-75/60132235.jpg'),
                  Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQrQ8-nDluM0TMzcbJUHfM-UPZSgNBAjnEJSdjnJj941uowl-2f&usqp=CAU')
                ],
              ),
            )
        )
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
