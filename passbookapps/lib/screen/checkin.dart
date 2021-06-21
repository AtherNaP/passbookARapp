import 'package:flutter/material.dart';

class checkin extends StatefulWidget {
  @override
  _checkinState createState() => _checkinState();
}

class _checkinState extends State<checkin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("จุดเช็คอิน"),
        backgroundColor: Color(0xFF18583B),
      ),
    );
  }
}
