import 'package:flutter/material.dart';

class clickUHistory extends StatefulWidget {
  @override
  _clickUHistoryState createState() => _clickUHistoryState();
}

class _clickUHistoryState extends State<clickUHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order History",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Order History",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
