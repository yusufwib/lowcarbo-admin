import 'package:flutter/material.dart';

void main() => runApp(Test());

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("faisal")),
      body: Column(
        children: <Widget>[
          Text("file")
        ],
      ),
    );
  }
}
