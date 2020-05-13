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
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _bigFont = const TextStyle(fontSize: 18);
  final Set<WordPair> _saved = Set<WordPair>();

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      // The itemBuilder callback is called once per suggested
      // word pairing, and places each suggestion into a ListTile
      // row. For even rows, the function adds a ListTile row for
      // the word pairing. For odd rows, the function adds a
      // Divider widget to visually separate the entries. Note that
      // the divider may be difficult to see on smaller devices.
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return Divider();
        }

        // The syntax "i ~/ 2" divides i by 2 and returns an
        // integer result.
        // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
        // This calculates the actual number of word pairings
        // in the ListView,minus the divider widgets.
        final int index = i ~/ 2;
        if (index >= _suggestions.length) {
          // If you've reached the end of the available word
          // pairings...
          _suggestions.addAll(generateWordPairs().take(10));
        }
        // build row funtion -> calling for each row dynamic generation
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _bigFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
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
