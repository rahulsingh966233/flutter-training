import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:olshopping/Auth/loginArt/customClipper.dart';
import 'package:olshopping/home.dart';

void main() {
  runApp(GridList());
}

class GridList extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'GreatVibes',
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
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //modify arrow color from here..
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,size: 30,),
          onPressed: () =>  Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          ),
        ),
        centerTitle: true,
      ),
      body: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.0),
            child: HomeScreen(),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var list = [
    'https://cdn.pixabay.com/photo/2016/01/19/15/05/baseball-field-1149153__340.jpg',
    'https://cdn.pixabay.com/photo/2018/05/31/11/54/celebration-3443779__340.jpg',
    'https://cdn.pixabay.com/photo/2016/12/28/20/30/wedding-1937022__340.jpg',
    'https://media.istockphoto.com/photos/its-christmas-time-picture-id1180798906?b=1&k=6&m=1180798906&s=170667a&w=0&h=5kSkLISTSrkKg3ZVVVJtHv3w_hDg5ZjoNbgGhcDhuIo=',
    'https://cdn.pixabay.com/photo/2015/06/12/18/26/team-807300__340.jpg',
    'https://cdn.pixabay.com/photo/2013/07/18/08/03/birthday-163362__340.jpg',
    'https://cdn.pixabay.com/photo/2019/04/14/20/05/duck-meet-4127713__340.jpg',
    'https://cdn.pixabay.com/photo/2015/09/18/11/38/audience-945449__340.jpg',
    'https://cdn.pixabay.com/photo/2015/11/30/23/32/eve-1071355__340.jpg',
    'https://cdn.pixabay.com/photo/2015/07/02/10/16/circus-828680__340.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
        body: AnimationLimiter(
          child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: <Widget>[
                for (var item in list)
                  AnimationConfiguration.staggeredGrid(
                    duration: const Duration(milliseconds: 200),
                    columnCount: 2,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child:
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: new BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 25.0, // soften the shadow
                                      spreadRadius: 7.0, //extend the shadow
                                      offset: Offset(
                                        10.0, // Move to right 10  horizontally
                                        5.0, // Move to bottom 5 Vertically
                                      ),
                                    )
                                  ],
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(item)
                                  )
                              )),
                        ),
                      ),
                    ),
                  ),
              ]),
        ));
  }
}

