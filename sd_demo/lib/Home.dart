import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:sddemo/BookDetail.dart';
import 'package:sddemo/main.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  var userProf;
  final String social_media;

  HomePage({Key key, @required this.userProf, @required this.social_media})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoggedIn = true;
  int currentIndex = 0;
  final facebookLogin = FacebookLogin();

  _logout() async {
    await facebookLogin.logOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoggedIn
        ? Scaffold(
            appBar: AppBar(
              leading: Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Image.network(
                    'http://www.studentdesk.in/img/logo.png',
                    height: 100,
                    width: 150,
                  )),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              actions: <Widget>[
                new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          widget.social_media == 'facebook'
                              ? widget.userProf["picture"]["data"]["url"]
                              : widget.userProf.photoUrl,
                        ))),
                IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: Colors.red[900],
                    ),
                    onPressed: _logout)
              ],
            ),
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: currentIndex,
              showElevation: true,
              itemCornerRadius: 8,
              curve: Curves.easeInBack,
              onItemSelected: (index) => setState(() {
                currentIndex = index;
              }),
              items: [
                BottomNavyBarItem(
                  icon: Icon(Icons.apps),
                  title: Text('Home'),
                  activeColor: Colors.red,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.people),
                  title: Text('Users'),
                  activeColor: Colors.purpleAccent,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            body: HomeView())
        : MyApp();
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static List<dynamic> bookData = [];

  Future<dynamic> fetchBookList() async {
    var response = await http
        .get('http://studentdesk.in/api/v1/newarrivals?&apiname=newArrivals');
    var decodeData = json.decode(response.body);
    setState(() {
      bookData = decodeData['data'];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchBookList();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'Search your book..',
                    ),
                  ),
                  suggestionsCallback: (pattern) async {
                    var response = await http.get(
                        'http://studentdesk.in/api/v1/text-search?apiname=textSearch&text=${pattern}');
                    return json.decode(response.body)['data'];
                  },
                  itemBuilder: (context, searchedData) {
                    return ListTile(
                      leading: Icon(Icons.book,color: Colors.green,),
                      title: Text(searchedData['name'],style: TextStyle(fontSize: 15),),
                    );
                  },
                  onSuggestionSelected: (suggestion) {},
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Books",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[600]),
                  ),
                ],
              ),
            ),
            Container(
                width: 210.0,
                color: Colors.white,
                child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 2.0,
                    height: 200.0,
                    autoPlay: true,
                  ),
                  items: bookData.length > 0
                      ? bookData.map<Widget>((item) {
                          return new Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Container(
                              margin: EdgeInsets.all(5.0),
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      Image.network(
                                        item['photo'],
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                        bottom: 0.0,
                                        left: 0.0,
                                        right: 0.0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromARGB(200, 0, 0, 0),
                                                Color.fromARGB(0, 0, 0, 0)
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        }).toList()
                      : [],
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "New Arrived",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[600]),
                  ),
                ],
              ),
            ),
            Text("${bookData.length}"),
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
                                                  type: PageTransitionType
                                                      .rightToLeftWithFade,
                                                  child: BookDetail()));
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
//
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
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
