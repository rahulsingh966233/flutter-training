import 'dart:ui';

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
      home: Scaffold(
        appBar: AppBar(
          title: Text("Widgets Demo"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    'header',
                  )),
                ),
                height: 50,
                color: Colors.green,
              ),
              Divider(
                thickness: 4,
                color: Colors.black,
              ),
              ListTile(
                title: Text('Option 1'),
              ),
              ListTile(
                title: Text('Option 1'),
              ),
              ListTile(
                title: Text('Option 1'),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
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
                  onPressed: () {},
                  child: Text(
                    'Tap Me',
                  ),
                ),
              ),
              Stack(
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      color: Colors.green,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    height: 60,
                    width: 60,
                  )
                ],
                overflow: Overflow.clip,
              ),
              SizedBox(
                height: 10,
              ),
              AnimatedOpacity(
                opacity: opacityLevel,
                duration: Duration(seconds: 3),
                child: Container(
                  width: 100,
                  child: FlutterLogo(),
                ),
              ),
              RaisedButton(
                child: Text('Fade Logo'),
                onPressed: _changeOpacity,
              ),
              Container(
                alignment: Alignment.center,
                child: Flexible(
                  child: FractionallySizedBox(
                    widthFactor: 0.3,
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text("hi"),
                    ),
                  ),
                ),
              ),
              Text("ListView", textAlign: TextAlign.center),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
//                color: Colors.lightBlue,
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    Container(
                      color: Colors.amber[600],
                      child: ListTile(
                        title: Text('Item1'),
                        subtitle: Text("Title"),
                        leading: Icon(Icons.verified_user),
                        trailing: Icon(Icons.border_horizontal),
                      ),
                    ),
                    Container(
                      color: Colors.amber[500],
                      child: ListTile(
                        title: Text('Item#2'),
                        subtitle: Text("Title"),
                        enabled: false,
                        leading: Icon(Icons.verified_user),
                        trailing: Icon(Icons.border_horizontal),
                      ),
                    ),
                    Container(
                      color: Colors.amber[100],
                      child: ListTile(
                        title: Text('Item3'),
                        subtitle: Text("Title"),
                        selected: true,
                        leading: Icon(Icons.verified_user),
                        trailing: Icon(Icons.border_horizontal),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Text("Container Demo, transform prop"),
                color: Colors.lightBlue,
                width: 200.0,
                height: 200.0,
                transform: Matrix4.rotationZ(0.10),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: SelectableText(
                  'My Selecatble Text',
                  showCursor: false,
                  toolbarOptions:
                      ToolbarOptions(copy: true, selectAll: true, paste: true),
                  onTap: () => print('Tapped'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Slider(
                  value: rating,
                  onChanged: (newRating) {
                    setState(() => rating = newRating);
                  },
                  min: 0,
                  max: 100,
                  divisions: 6,
                  label: "$rating",
                ),
              ),
              Container(
                child: RangeSlider(
                  values: selectedRange,
                  onChanged: (RangeValues newRange) {
                    setState(() => selectedRange = newRange);
                  },
                  min: 0.0,
                  max: 2.0,
                  divisions: 10,
                  labels: RangeLabels(
                      '${selectedRange.start}', '${selectedRange.end}'),
                ),
              ),
              Container(
                  child: CupertinoSlider(
                value: rating,
                min: 0.0,
                max: 100.0,
                onChanged: (value) {
                  setState(() {
                    rating = value.roundToDouble();
                  });
                },
              )),
              SizedBox(
                height: 20,
              ),
              Container(
                child: AlertDialog(
                  title: Text("Accept?"),
                  content: Text("Do you Accept?"),
                  actions: [
                    FlatButton(
                      child: Text("No"),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: Text("Yes"),
                      textColor: Colors.blue,
                      onPressed: () {},
                    )
                  ],
                  elevation: 24.0,
                  backgroundColor: Colors.lightBlue[100],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: AnimatedCrossFade(
                  crossFadeState: isUser
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstCurve: Curves.easeOut,
                  secondCurve: Curves.easeIn,
                  sizeCurve: Curves.bounceOut,
                  duration: const Duration(seconds: 3),
                  firstChild: Text("Hello, GoodMorning"),
                  secondChild: Text("Hey, Good Noon"),
                ),
              ),
              FlatButton(
                child: Text('Click'),
                onPressed: () => setState(() {
                  if (isUser == false) {
                    isUser = true;
                  } else {
                    isUser = false;
                  }
                }),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: ColorFiltered(
                  colorFilter:
                      ColorFilter.mode(Colors.white, BlendMode.saturation),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/a.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("ToggleButtons"),
              SizedBox(
                height: 10,
              ),
              Container(
                child: ToggleButtons(
                  children: [
                    Icon(
                      Icons.local_cafe,
                      color: Colors.green,
                    ),
                    Icon(
                      Icons.wb_incandescent,
                      color: Colors.yellow[900],
                    ),
                    Icon(
                      Icons.supervised_user_circle,
                      color: Colors.cyan[900],
                    ),
                    Icon(Icons.shop),
                  ],
                  selectedBorderColor: Colors.deepOrange,
//                  fillColor: Colors.lightGreenAccent,
                  renderBorder: true,
                  selectedColor: Colors.pink[100],
//                  borderRadius: BorderRadius.circular(30),
//                  borderWidth: 5,
//                  borderColor: Colors.grey,
                  highlightColor: Colors.teal,
                  splashColor: Colors.purple,
                  isSelected: _selectOptions,
                  disabledBorderColor: Colors.blueGrey,
                  hoverColor: Colors.redAccent,
                  onPressed: (int index) {
                    setState(() {
                      _selectOptions[index] = !_selectOptions[index];
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Image.network(
                  'https://images.homify.com/images/a_0,c_fill,f_auto,h_632,q_auto,w_632/v1490006803/p/photo/image/1913408/Trilok_ji_Cam-7/asian-living-room-photos-by-homify.jpg',
                  loadingBuilder: (context, child, progress) {
                    return progress == null
                        ? child
                        : LinearProgressIndicator(
                            backgroundColor: Colors.blue,
                          );
                  },
                  semanticLabel: 'Interior',
                  width: 200,
                ),
              ),
              Builder(
                builder: (context) => RaisedButton(
                    child: Text('Show Snackbar'),
                    onPressed: () {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Show Snackbar'),
                        duration: Duration(seconds: 3),
                      ));
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Text("ListWheelScrollView"),
              Container(
                height: 500,
                child: Center(
                  child: ListWheelScrollView(
                    controller: _controller,
                    itemExtent: 80,
                    magnification: 1.1,
                    useMagnifier: true,
                    physics: FixedExtentScrollPhysics(),
                    children: listtiles, //List of widgets
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
                indent: 80,
                endIndent: 80,
              ),
              Container(
                child: ShaderMask(
                  shaderCallback: (bounds) => RadialGradient(
                          center: Alignment.topLeft,
                          radius: 1.0,
                          colors: [Colors.green, Colors.deepOrange],
                          tileMode: TileMode.mirror)
                      .createShader(bounds),
                  child: const Text(
                    'Burning Text!!',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
                indent: 80,
                endIndent: 80,
              ),
              Container(
                height: 100,
                decoration:
                    ShapeDecoration(shape: CircleBorder(), color: Colors.blue),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
                indent: 80,
                endIndent: 80,
              ),
              Container(
                height: 10,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.green,
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
                indent: 80,
                endIndent: 80,
              ),
              CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
                indent: 80,
                endIndent: 80,
              ),
              Container(
                  child: IgnorePointer(
                ignoring: true,
                child: RaisedButton(
                  onPressed: () => print("IgnorePoint"),
                  child: Text("Unclickable button"),
                ),
              )),
              AbsorbPointer(
                child: RaisedButton(
                  onPressed: () => print("AbsorbPoint"),
                  child: Text("Unclickable button"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('CupertinoActivityIndicator'),
              Container(
                height: 50,
                child: CupertinoActivityIndicator(),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: OutlineButton(
                  child: Text("Outline Button"),
                  highlightedBorderColor: Colors.green,
                  onPressed: () {},
                ),
              ),
              CheckboxListTile(
                title: const Text('Animate Slowly'),
                value: timeDilation != 1.0,
                onChanged: (bool value) {
                  setState(() {
                    timeDilation = value ? 10.0 : 1.0;
                  });
                },
                secondary: const Icon(Icons.hourglass_empty),
              ),

              Container(
                height: 200,
                child: IndexedStack(
                  index: _index,
                  children: <Widget>[
                    Container(
                      color: Colors.pink,
                      child: Center(
                        child: Text('Page 1'),
                      ),
                    ),
                    Container(
                      color: Colors.cyan,
                      child: Center(
                        child: Text('Page 2'),
                      ),
                    ),
                    Container(
                      color: Colors.deepPurple,
                      child: Center(
                        child: Text('Page 3'),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      if (_index <= 0) return;
                      setState(() {
                        _index -= 1;
                      });
                    },
                    child: Text(
                      "Prev",
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      if (_index >= 2) return;
                      setState(() {
                        _index += 1;
                      });
                    },
                    child: Text(
                      "Next",
                    ),
                  )
                ],
              ),
              Container(
                height: 200,
                child: Stack(
                  children: <Widget>[
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                      left: _left,
                      top: _top,
                      right: _right,
                      bottom: _bottom,
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      _left = _first ? 10 : 20;
                      _top = _first ? 70 : 20;
                      _right = _first ? 10 : 20;
                      _bottom = _first ? 70 : 20;
                      _first = !_first;
                    });
                  },
                  child: Text('Go'),
                  color: Colors.red,
                  textColor: Colors.yellowAccent,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),

            ],
          ),
        ),
      ),
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
