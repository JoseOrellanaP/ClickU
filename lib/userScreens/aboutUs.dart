import 'package:flutter/material.dart';

class clickUAboutUs extends StatefulWidget {
  @override
  _clickUAboutUsState createState() => _clickUAboutUsState();
}

class _clickUAboutUsState extends State<clickUAboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "About Us"
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "About Us",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
