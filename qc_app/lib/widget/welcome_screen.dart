import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qcapp/api/welcome_screen_data.dart';
import 'package:qcapp/widget/studyList.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreen createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
  PageController pageController;

  void onNextTap(int index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    int totalPage = LandingScreenItems.loadLandingScreenItem().length;
    return MaterialApp(
      title: "Study list",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.redAccent,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25.0),
              headline5: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              bodyText1: TextStyle(fontSize: 14.0, color: Colors.black),
              bodyText2: TextStyle(fontSize: 14.0, color: Colors.black))),
      home: Scaffold(
        body: PageView.builder(
          itemCount: totalPage,
          itemBuilder: (BuildContext context, int index) {
            LandingScreenItem li =
                LandingScreenItems.loadLandingScreenItem()[index];

            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: li.color,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Image.asset(li.image)),
                  Column(
                    children: <Widget>[
                      Text(
                        li.title,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        li.subTitle,
                        style: Theme.of(context).textTheme.headline5,
                      )
                    ],
                  ),
                  index == totalPage - 1
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green[500],
                          ),
                          width: double.infinity,
                          height: 50.0,
                          child: RaisedButton(
                            child: Text(
                              "Sign Up",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            highlightColor: Colors.green[500],
                            color: Colors.green,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StudyList()),
                              );
                            },
                          ),
                        )
                      : Container(
                          height: 12.0,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: totalPage,
                            itemBuilder: (BuildContext context, int i) {
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: index == i
                                          ? Colors.green
                                          : Colors.grey,
                                      shape: BoxShape.circle),
                                  width: 20.0,
                                ),
                              );
                            },
                          ),
                        ),
                  GestureDetector(
                    onTap: () {
                      onNextTap(index + 1);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.green[500],
                      ),
                      child: Center(
                          child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )),
                      width: double.infinity,
                      height: 50.0,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
