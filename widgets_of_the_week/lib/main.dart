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
  double opacityLevel = 1.0;
  double rating = 1;
  var selectedRange = RangeValues(0.2, 0.8);
  bool isUser = false;
  List<bool> _selectOptions = List.generate(4, (_) => false);

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
                child: ColorFiltered(
                  colorFilter:
                      ColorFilter.mode(Colors.green, BlendMode.saturation),
                  child: Image.asset('assets/a.png'),
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
              )
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
