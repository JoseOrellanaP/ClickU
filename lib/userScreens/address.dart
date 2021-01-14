import 'package:flutter/material.dart';

class clickUAdress extends StatefulWidget {
  @override
  _clickUAdressState createState() => _clickUAdressState();
}

class _clickUAdressState extends State<clickUAdress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Address"
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "My Address",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
