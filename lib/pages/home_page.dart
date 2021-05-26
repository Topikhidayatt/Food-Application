import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Padding(
      padding: EdgeInsets.only(top: 40, left: 16, right: 15, bottom: 16),
      child: Column(
        children: [],
      ),
    );
  }
}
