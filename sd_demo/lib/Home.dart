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
        child: bookData.length != 0
            ? Column(
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
                            leading: Icon(
                              Icons.book,
                              color: Colors.green,
                            ),
                            title: Text(
                              searchedData['name'],
                              style: TextStyle(fontSize: 15),
                            ),
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
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                          height: 200,
                          aspectRatio: 2.0,
                          viewportFraction: 0.8,
                          initialPage: 2,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 2),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal,
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
                                        blurRadius: 4.0,
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.all(5.0),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
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
                                                      Color.fromARGB(
                                                          200, 0, 0, 0),
                                                      Color.fromARGB(0, 0, 0, 0)
                                                    ],
                                                    begin:
                                                        Alignment.bottomCenter,
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
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          for (var bData in bookData)
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              height: 250.0,
                              width: 220.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.green[200],
                                    offset: Offset(2.0, 2.0), //(x,y)
                                    blurRadius: 9.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    color: Colors.green[100],
                                    width: 180.0,
                                    child: FlatButton(
                                      child: Card(
                                        elevation: 9,
                                        child: Image.network(
                                          bData['photo'],
                                          height: 190.0,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType
                                                    .rightToLeftWithFade,
                                                child: BookDetail(
                                                    bookId: bData['id'])));
                                      },
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Flexible(
                                        child: Container(
                                          margin:
                                              EdgeInsets.fromLTRB(10, 0, 10, 5),
                                          child: Text(
                                            bData['name'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            maxLines: 2,
                                            textAlign: TextAlign.start,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                          child: Text.rich(
                                        TextSpan(
                                          children: <TextSpan>[
                                            new TextSpan(
                                              text: "₹${bookData[0]['mrp']}  ",
                                              style: new TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                            new TextSpan(
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                              text: " ₹${bookData[0]['price']}",
                                            ),
                                          ],
                                        ),
                                      )),
                                    ],
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
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
