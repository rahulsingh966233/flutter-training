import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class RandomWords extends StatefulWidget {
  @override
  RandomWordState createState() => RandomWordState();
}

class RandomWordState extends State<RandomWords> {
  Widget build(BuildContext context) {
    return Scaffold(
      // header setup
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      // funtion calling
      body: _buildSuggestions(),
    );
  }

  // variable declaration
  final List<WordPair> _suggeestions = <WordPair>[];
  final TextStyle _bigFont = const TextStyle(fontSize: 18);

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return Divider();
        }

        final int index = i ~/ 2;
        if (index >= _suggeestions.length) {
          // take words till 10 only
          _suggeestions.addAll(generateWordPairs().take(10));
        }
        // build row funtion calling for each row dynamic generation
        return _buildRow(_suggeestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _bigFont,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StartUp Name Genrator',
      home: RandomWords(),
    );
  }
}
