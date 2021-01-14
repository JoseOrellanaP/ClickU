import 'package:flutter/material.dart';

class clickUNotifications extends StatefulWidget {
  @override
  _clickUNotificationsState createState() => _clickUNotificationsState();
}

class _clickUNotificationsState extends State<clickUNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Notification",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Order notification",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
