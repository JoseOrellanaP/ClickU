import 'package:flutter/material.dart';

class AppMesages extends StatefulWidget {
  @override
  _AppMesagesState createState() => _AppMesagesState();
}

class _AppMesagesState extends State<AppMesages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "App Messages"
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "AppMesages",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
