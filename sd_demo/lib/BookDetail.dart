import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookDetail extends StatefulWidget {
  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  static List<dynamic> bookData = [];

  Future<dynamic> fetchBookDetail() async {
    var response =
        await http.get('http://studentdesk.in/api/v1/book-details/12196');
    setState(() {
      bookData = json.decode(response.body)['data'];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchBookDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.green),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          bookData[0]['name'],
          style: TextStyle(
              color: Colors.red[900],
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                    margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Stack(
                          children: <Widget>[
                            Image.network(
                              bookData[0]['photo'],
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        new TextSpan(
                          text: "₹${bookData[0]['mrp']}  ",
                          style: new TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
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
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey[200],
              height: 20,
              thickness: 2,
              indent: 10,
              endIndent: 130,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Author"),
                  Text(bookData[0]['author'],style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Name"),
                  Text(bookData[0]['name']),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Sellar Name"),
                  Text(bookData[0]['user']['name'],style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Address"),
                  Text("${bookData[0]['user']['city']['city_name']}"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Phone Number"),
                  Text("+91-${bookData[0]['phone_number']}",style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Status"),
                  Text(
                    "${bookData[0]['book_status'] == "1" ? "Available" : 'Not Available'}",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[200],
              height: 20,
              thickness: 2,
              indent: 100,
              endIndent: 100,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: OutlineButton(
                textColor: Colors.red[800],
                color: Colors.red,
                child: Text(
                  "Order now",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
