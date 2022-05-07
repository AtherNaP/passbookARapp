import 'package:flutter/material.dart';


import 'components/body.dart';




class profileuser extends StatefulWidget {
  @override
  _profileuserState createState() => _profileuserState();
}

class _profileuserState extends State<profileuser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile",style: TextStyle(color: Colors.black),),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Body(),
        
      ),
    );
  }
}
