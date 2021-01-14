import 'package:flutter/material.dart';

class AppHistory extends StatefulWidget {
  @override
  _AppHistoryState createState() => _AppHistoryState();
}

class _AppHistoryState extends State<AppHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "App History"
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "AppHistory",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
