import 'package:flutter/material.dart';
import 'package:olshopping/Auth/signin.dart';
import 'package:olshopping/detail.dart';
import 'package:olshopping/editProfile.dart';
import 'package:olshopping/grid.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NotoSerif',
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;

  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 40.0,
        items: <Widget>[
          Icon(Icons.home, size: 20),
          Icon(Icons.details, size: 20),
          Icon(Icons.verified_user  , size: 20),
        ],
        color: Colors.teal[400],
        buttonBackgroundColor:
        _page.toString() == '0' ? Colors.teal[100] : Colors.white,
        backgroundColor:
        _page.toString() == '0' ? Colors.teal[100] : Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 900),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      appBar: AppBar(
        title: Text("PhotoGraphy"),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: [
                  Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage("https://images.unsplash.com/photo-1533463107614-05572"
                                  "aa79fe7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60")
                          )
                      )),
                  Text("Shubhangi Ambade",
                      textScaleFactor: 1.5,style: TextStyle(letterSpacing: 3,color: Colors.white),),
                  Text("Photographer",
                    textScaleFactor: 1.1,style: TextStyle(letterSpacing: 3,color: Colors.white),)
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFF36BA7A),
              ),
            ),

            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.home),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Home'),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.upToDown,
                        child: MyApp()));
              },
            ),
            ListTile(
              title:  Row(
                children: <Widget>[
                  Icon(Icons.home),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Home'),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.upToDown,
                        child: MyApp()));
              },
            ),
            Divider(thickness: 1,endIndent: 60,),
            ListTile(
              title: Row(
                children: <Widget>[
                  Icon(Icons.vpn_key),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Sign In'),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.upToDown,
                        child: MyLoginPage()));
              },
            ),
            ListTile(
              title:  Row(
                children: <Widget>[
                  Icon(Icons.shop),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Item 2'),
                  )
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title:  Row(
                children: <Widget>[
                  Icon(Icons.weekend),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Item 3'),
                  )
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title:  Row(
                children: <Widget>[
                  Icon(Icons.favorite),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Item 3'),
                  )
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title:  Row(
                children: <Widget>[
                  Icon(Icons.contact_mail),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Item 3'),
                  )
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title:  Row(
                children: <Widget>[
                  Icon(Icons.label_important),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Item 3'),
                  )
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title:  Row(
                children: <Widget>[
                  Icon(Icons.zoom_out),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Item 3'),
                  )
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(thickness: 1,endIndent: 60,),
            ListTile(
              title: Text('0.0.1'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Scaffold(
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.0),
              child: _page.toString() == '0'
                  ? HomeScreen()
                  : _page.toString() == '1'
                  ? DetailScreen()
                  : _page.toString() == '2' ? ProfilePage() : ""),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class Data {
  String url;
  Data({this.url});
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedValue;
  final List<DropdownMenuItem> items = [];
  final snackBar = SnackBar(content: Text('yes, clicked!'));
  final data = Data(url: '');
  String preselectedValue = "dolor sit";
  final String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  void initState() {
    String wordPair = "";
    loremIpsum
        .toLowerCase()
        .replaceAll(",", "")
        .replaceAll(".", "")
        .split(" ")
        .forEach((word) {
      if (wordPair.isEmpty) {
        wordPair = word + " ";
      } else {
        wordPair += word;
        if (items.indexWhere((item) {
          return (item.value == wordPair);
        }) ==
            -1) {
          items.add(DropdownMenuItem(
            child: Text(wordPair),
            value: wordPair,
          ));
        }
        wordPair = "";
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Home",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(19, 10, 10, 20),
                child: Container(
                  color: Colors.white,
                  child: SearchableDropdown.single(
                    items: items,
                    value: selectedValue,
                    hint: "Search your Text",
                    searchHint: "Search your Text",
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    isExpanded: true,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(23, 0, 20, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Category",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 130.0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 180.0,
                              child: FlatButton(
                                child: Card(
                                  elevation: 9,
                                  child: Image.network(
                                    'https://cdn.shootdotedit.com/wp-content/uploads/2017/02/15102338/SaltandPinePhotography_LandscapeBlog.jpg',
//                                  height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.upToDown,
                                          child: GridList()));
                                },
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 10, 80, 0),
                                child: Text("Wedding"),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 130.0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 180.0,
                              child: FlatButton(
                                child: Card(
                                  elevation: 9,
                                  child: Image.network(
                                      'https://images.unsplash.com/photo-1472653431158-6364773b2a56?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60'),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          child: GridList()));
                                },
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 10, 80, 0),
                                child: Text("Events"),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 130.0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 180.0,
                              child: FlatButton(
                                child: Card(
                                  elevation: 9,
                                  child: Image.network(
                                      'https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60'),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          child: GridList()));
                                },
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 10, 80, 0),
                                child: Text("Fashion"),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 130.0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 180.0,
                              child: FlatButton(
                                child: Card(
                                  elevation: 9,
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1559455208-f82921450174?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          child: GridList()));
                                },
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 10, 80, 0),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Birthday")),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Popular Photographer",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Row(
                      children: <Widget>[
                        Stack(children: [
                          Container(
                            margin: EdgeInsets.all(20),
                            width: 250,
                            height: 350,
                            alignment: Alignment(-0.9, -0.9),
                            child: RaisedButton(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.scale,
                                        duration: Duration(seconds: 1),
                                        child: DetailScreen()));
                              },
                              child: Image.network(
                                  'https://i.pinimg.com/236x/f7/ab/d3/f7abd324b57865155f8e2f5799820b29.jpg',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Positioned(
                            top: 250,
                            left: 42,
                            width: 218,
                            child: Container(
                                child: Center(
                                  child: Card(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const ListTile(
                                            contentPadding:
                                            EdgeInsets.fromLTRB(20, 0, 10, 0),
                                            title: Text(
                                              'Tamara Bellies',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  height: 2),
                                            ),
                                            subtitle: Text(
                                              '◉ Corfu, Greece1',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.grey),
                                            )),
                                        ButtonTheme(
                                          padding: EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: new ButtonBar(
                                            buttonPadding:
                                            EdgeInsets.fromLTRB(15, 0, 0, 0),
                                            alignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Align(
                                                child: RaisedButton(
                                                  onPressed: () {},
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text: '\$',
                                                      style: DefaultTextStyle
                                                          .of(
                                                          context)
                                                          .style,
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            text: '23 /',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                        TextSpan(
                                                            text: ' hr',
                                                            style: TextStyle(
                                                                color:
                                                                Colors.grey)),
                                                      ],
                                                    ),
                                                  ),
                                                  color: Colors.white,
//                                                  textColor: Colors.white,
                                                  elevation: 0,
                                                ),
                                              ),
                                              Container(
//                                                margin: EdgeInsets.fromLTRB(15, 13, 0, 0),
                                                child: Align(
                                                  alignment: Alignment
                                                      .bottomRight,
                                                  child: FlatButton(
                                                    padding: EdgeInsets
                                                        .fromLTRB(
                                                        29, 2, 0, 0),
                                                    onPressed: () {},
                                                    child: Icon(
                                                      Icons.add_box,
                                                      size: 42,
                                                      color: Colors.black,
                                                    ),
                                                    textColor: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ]),
                        Stack(children: [
                          Container(
                            margin: EdgeInsets.all(20),
                            width: 250,
                            height: 350,
                            alignment: Alignment(-0.9, -0.9),
                            child: RaisedButton(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.scale,
                                        duration: Duration(seconds: 1),
                                        child: DetailScreen()));
                              },
                              child: Image.network(
                                  'https://i.pinimg.com/236x/a4/58/45/a45845796a90913612c14b7736d9ec40.jpg',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Positioned(
                            top: 250,
                            left: 43,
                            width: 218,
                            child: Container(
                                alignment: Alignment(-0.9, -0.9),
                                child: Center(
                                  child: Card(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const ListTile(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                20, 0, 10, 0),
//                                          leading: Icon(Icons.album),
                                            title: Text(
                                              'Tamara Bellies',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  height: 2),
                                            ),
                                            subtitle: Text(
                                              '◉ Corfu, Greece',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.grey),
                                            )),
                                        ButtonTheme(
                                          padding:
                                          EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: new ButtonBar(
                                            buttonPadding: EdgeInsets.fromLTRB(
                                                15, 0, 0, 0),
                                            alignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: RaisedButton(
                                                  onPressed: () {},
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text: '\$',
                                                      style:
                                                      DefaultTextStyle
                                                          .of(
                                                          context)
                                                          .style,
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            text: '23 /',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                        TextSpan(
                                                            text: ' hr',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey)),
                                                      ],
                                                    ),
                                                  ),
                                                  color: Colors.white,
//                                                  textColor: Colors.white,
                                                  elevation: 0,
                                                ),
                                              ),
                                              Container(
//                                                margin: EdgeInsets.fromLTRB(15, 13, 0, 0),
                                                child: Align(
                                                  alignment:
                                                  Alignment.bottomRight,
                                                  child: FlatButton(
                                                    padding:
                                                    EdgeInsets.fromLTRB(
                                                        29, 2, 0, 0),
                                                    onPressed: () {},
                                                    child: Icon(
                                                      Icons.add_box,
                                                      size: 42,
                                                      color: Colors.black,
                                                    ),
                                                    textColor: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ]),
                        Stack(children: [
                          Container(
                            margin: EdgeInsets.all(20),
                            width: 250,
                            height: 350,
                            alignment: Alignment(-0.9, -0.9),
                            child: RaisedButton(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.scale,
                                        duration: Duration(seconds: 1),
                                        child: DetailScreen()));
                              },
                              child: Image.network(
                                  'https://i.pinimg.com/236x/41/81/bc/4181bca420207dc00e6b6622d88633bd.jpg',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Positioned(
                            top: 250,
                            left: 43,
                            width: 218,
                            child: Container(
                                alignment: Alignment(-0.9, -0.9),
                                child: Center(
                                  child: Card(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const ListTile(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                20, 0, 10, 0),
//                                          leading: Icon(Icons.album),
                                            title: Text(
                                              'Tamara Bellies',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  height: 2),
                                            ),
                                            subtitle: Text(
                                              '◉ Corfu, Greece',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.grey),
                                            )),
                                        ButtonTheme(
                                          padding:
                                          EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: new ButtonBar(
                                            buttonPadding: EdgeInsets.fromLTRB(
                                                15, 0, 0, 0),
                                            alignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: RaisedButton(
                                                  onPressed: () {},
                                                  child: RichText(
                                                    text: TextSpan(
                                                      text: '\$',
                                                      style:
                                                      DefaultTextStyle
                                                          .of(
                                                          context)
                                                          .style,
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            text: '23 /',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                        TextSpan(
                                                            text: ' hr',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey)),
                                                      ],
                                                    ),
                                                  ),
                                                  color: Colors.white,
//                                                  textColor: Colors.white,
                                                  elevation: 0,
                                                ),
                                              ),
                                              Container(
//                                                margin: EdgeInsets.fromLTRB(15, 13, 0, 0),
                                                child: Align(
                                                  alignment:
                                                  Alignment.bottomRight,
                                                  child: FlatButton(
                                                    padding:
                                                    EdgeInsets.fromLTRB(
                                                        29, 2, 0, 0),
                                                    onPressed: () {},
                                                    child: Icon(
                                                      Icons.add_box,
                                                      size: 42,
                                                      color: Colors.black,
                                                    ),
                                                    textColor: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ])
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
