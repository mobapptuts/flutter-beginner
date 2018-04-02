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
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        itemBuilder: (context, i) {
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    final wordPairs = new WordPair.random();
    return new Text(wordPairs.asPascalCase);
  }

}

class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to hello world app',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Hello Flutter App'),
        ),
        body: new Center(
          child: new RandomWords(),
        ),
      ),
    );
  }

}
