import 'package:flutter/material.dart';

class coupon extends StatefulWidget {
  @override
  _couponState createState() => _couponState();
}

class _couponState extends State<coupon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แลกของรางวัล"),
        backgroundColor: Color(0xFF18583B),
      ),
    );
  }
}
