import 'package:flutter/material.dart';

class clickUFavorities extends StatefulWidget {
  @override
  _clickUFavoritiesState createState() => _clickUFavoritiesState();
}

class _clickUFavoritiesState extends State<clickUFavorities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Favorites"),
      ),
      body: Center(
        child: Text(
          "My favorites",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
