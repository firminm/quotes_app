import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './characters_page.dart';

class Favorites extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<Favorites> {
  final _randomWordPairs = <WordPair>[];
  final _savedWordPairs = Set<WordPair>();

  Widget _buildList() {
    final Iterable<ListTile> tiles = _savedWordPairs.map((WordPair pair) {
      return ListTile(
          title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16.0)));
    });

    final List<Widget> divided =
        ListTile.divideTiles(context: context, tiles: tiles).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Saved WordPairs')),
      body: ListView(children: divided),
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _savedWordPairs.contains(pair);

    return ListTile(
      title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18.0)),
      trailing: IconButton(
        icon: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null),
        onPressed: () {
          setState(() {
            if (alreadySaved) {
              _savedWordPairs.remove(pair);
            } else {
              _savedWordPairs.add(pair);
            }
          });
        },
      ),
      onLongPress: () {},
    );
  }

  void _pushSaved() {
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _savedWordPairs.map((WordPair pair) {
        return ListTile(
            title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16.0)));
      });

      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
        appBar: AppBar(title: Text('Saved WordPairs')),
        body: ListView(children: divided),
      );
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('WordPair Generator')),
      body: _buildList(),
    );
  }
}
