import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olshopping/home.dart';

void main() {
  runApp(DetailScreen());
}

class DetailScreen extends StatelessWidget {
  // This widget is the root of your application.
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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        iconTheme: IconThemeData(
//          color: Colors.white, //modify arrow color from here..
//        ),
//        leading: IconButton(
//          icon: Icon(Icons.arrow_back, color: Colors.white,size: 30,),
//          onPressed: () =>  Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => MyApp()),
//          ),
//        ),
//        centerTitle: true,
//      ),
      body: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SizedBox(
                  child: SingleChildScrollView(

                child: Stack(children: [
                  Card(
                    elevation: 9,
                    child: Container(
                      height: 800,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10,0,10,10),
                        width: double.infinity,
                        height: 350,
                        alignment: Alignment(-0.9, -0.9),
                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(),
                              ),
                            );
                          },
                          child: Image.network(
                            'https://i.pinimg.com/236x/f7/ab/d3/f7abd324b57865155f8e2f5799820b29.jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 300,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 42,
                    width: 312,
                    height: 700,
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
                                  'Tamara Bellis',
                                  style: TextStyle(
                                      fontSize: 20,
                                      letterSpacing: 4,
                                      fontWeight: FontWeight.bold,
                                      height: 2),
                                ),
                                subtitle: Text(
                                  'Photographer',
                                  style: TextStyle(
                                    letterSpacing: 4,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey),
                                )),
                            ButtonTheme(
                              padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                              child: new ButtonBar(
                                buttonPadding: EdgeInsets.fromLTRB(36, 0, 0, 0),
                                alignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '◉ Corfu, Greece1',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey),
                                  ),
                                  Align(
                                    child: RaisedButton(
                                      padding: EdgeInsets.all(10),
                                      onPressed: () {},
                                      child: RichText(
                                        text: TextSpan(
                                          text: '\$',
                                          style: TextStyle(color: Colors.white),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: '23 /',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)),
                                            TextSpan(
                                                text: ' hr',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                      color: Colors.black,
                                      elevation: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                              child: Text(
                                'Corfu is absolutely romantic and calm  in the evenings, '
                                'especially next to the sea. '
                                'Few days ago me and my husband Pete has a chance to spend.',
                                style: TextStyle(
                                    color: Colors.grey,
                                    wordSpacing: 2,
                                    textBaseline: TextBaseline.alphabetic,
                                    height: 2),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(22, 0, 0, 5),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Read More",
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                        decorationThickness: 5),
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(9, 20, 10, 0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 130.0,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            width: 120.0,
                                            child: FlatButton(
                                              child: Image.network(
                                                'https://images.pexels.com/photos/941555/pexels-photo-941555.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 130.0,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            width: 120.0,
                                            child: FlatButton(
                                              child: Image.network(
                                                  'https://images.pexels.com/photos/206434/pexels-photo-206434.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', height: 100,
                                                fit: BoxFit.cover,),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 130.0,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            width: 120.0,
                                            child: FlatButton(
                                              child: Image.network(
                                                  'https://images.unsplash.com/photo-1484329148740-e09e6c78c1e0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=60', height: 100,
                                                fit: BoxFit.cover,),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 130.0,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            width: 120.0,
                                            child: FlatButton(
                                              child: Image.network(
                                                'https://images.pexels.com/photos/3686769/pexels-photo-3686769.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 50,
                              margin: EdgeInsets.fromLTRB(20,0,20,20),
                              child: RaisedButton(
                                color: Colors.black,
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                onPressed: () {
                                },
                                child: Text("Contact me", style: TextStyle(color: Colors.white,fontSize: 15),),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                  ),
                ]),
              ))),
        ),
//        new Positioned(
//          top: 0.0,
//          left: 0.0,
//          right: 60.0,
//          child: Container(
//            child: Align(
//              alignment: Alignment.topLeft,
//              child: new IconButton(
//                icon: new Icon(Icons.arrow_back_ios, color: Colors.grey),
//                onPressed: () => Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) => MyApp(),
//                  ),
//                ),
//              ),
//            ),
//          ),
//        ),
      ]),
    );
  }
}
