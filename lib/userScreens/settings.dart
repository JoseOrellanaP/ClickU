import 'package:flutter/material.dart';

class clickUSettings extends StatefulWidget {
  @override
  _clickUSettingsState createState() => _clickUSettingsState();
}

class _clickUSettingsState extends State<clickUSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Settings"
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "My Settings",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
