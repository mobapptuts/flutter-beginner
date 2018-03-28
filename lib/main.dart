import 'package:flutter/material.dart';

void main() => runApp(new HelloWorldApp());

class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to hello world app',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Hello Flutter App'),
        ),
        body: new Center(
          child: new Text('Hello Flutter'),
        ),
      ),
    );
  }

}
