import 'package:flutter/material.dart';

class ClickUCart extends StatefulWidget {
  @override
  _ClickUCartState createState() => _ClickUCartState();
}

class _ClickUCartState extends State<ClickUCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Cart"
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "My cart",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
