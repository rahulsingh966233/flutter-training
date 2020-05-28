import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomepage(),
    );
  }
}

class Kitten {
  const Kitten({this.name, this.description, this.age, this.imageUrl});
  final String name;
  final String description;
  final int age;
  final String imageUrl;
}

final String server =
    defaultTargetPlatform == TargetPlatform.android ? "10.0.2.2" : "localhost";
final List<Kitten> _kittens = <Kitten>[
  Kitten(
    name: "Mittens",
    description: "The pinacle of cats. when Mittens sits in your lap, you feel like royalty.",
    age: 11,
    imageUrl:
         "images/kitty1.jpg",
  ),
  Kitten(
    name: "Fluffy",
    description: "World\'s cutest  kitten. Seriously. we dod the research.",
    age: 6,
    imageUrl:
        "images/kitty5.jpg",
  ),
  Kitten(
    name: "Scooter",
    description: "Chases string faster then 9/10 competing kittens.",
    age: 2,
    imageUrl:
        "images/kitty2.jpg",
  ),
  Kitten(
    name: "Steve",
    description: "Steave is cool and just kind of hangs out.",
    age: 4,
    imageUrl:
          "images/kitty3.jpg",
  ),
  Kitten(
    name: "Flocky",
    description: "Flocky is cute.",
    age: 26,
    imageUrl:
        "images/kitty4.jpg",
  ),
];

class MyHomepage extends StatelessWidget {
  Widget _dialogBuilder(BuildContext context, Kitten kitten) {
    return SimpleDialog(
      children:[
        Image.asset(
          kitten.imageUrl,
          fit: BoxFit.fill,
        ),
        Padding(  
          padding: EdgeInsets.all(16.0),
          child: Column(   
            children: <Widget>[

            ],
          ),
        )
      ],
    );
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => _dialogBuilder(context, _kittens[index])),
      child: Container(
        padding: EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(_kittens[index].name,
            style: Theme.of(context).textTheme.headline6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Kittens"),
      ),
      body: ListView.builder(
        itemBuilder: _listItemBuilder,
        itemCount: _kittens.length,
        itemExtent: 60.0,
      ),
    );
  }
}
