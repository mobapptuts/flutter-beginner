import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new HelloWorldApp());

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildRow(WordPair pair) {
    final _isAlreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        _isAlreadySaved ? Icons.favorite : Icons.favorite_border,
        color: _isAlreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          _isAlreadySaved ? _saved.remove(pair) : _saved.add(pair);
        });
      },
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if(i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

}

class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to hello world app',
      home: new RandomWords(),
    );
  }

}
