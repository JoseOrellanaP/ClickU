import 'package:flutter/material.dart';

class AppUsers extends StatefulWidget {
  @override
  _AppUsersState createState() => _AppUsersState();
}

class _AppUsersState extends State<AppUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "App Users"
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "App Users",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
