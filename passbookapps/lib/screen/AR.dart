import 'package:flutter/material.dart';
import 'package:passbookapps/screen/components/view.dart';

class listAR extends StatefulWidget {
  @override
  _ListARState createState() => _ListARState();
}

class _ListARState extends State<listAR> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "โมเดลจำลอง ",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              backgroundColor: Colors.green,
              //เปลี่ยนสี
              elevation: 10.0,
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 24.0),
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Card(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 8,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return viewbody();
                              }));
                            },
                          )
                          ,
                          ),
                    )
                  ],
                ),
              ),
            )));
  }
}
