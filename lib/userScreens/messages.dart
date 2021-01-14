import 'package:flutter/material.dart';

class clickUMessages extends StatefulWidget {
  @override
  _clickUMessagesState createState() => _clickUMessagesState();
}

class _clickUMessagesState extends State<clickUMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Messages"
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "My messages",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
