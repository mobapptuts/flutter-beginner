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
