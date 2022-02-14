
import 'package:flutter/material.dart';

import 'package:passbookapps/screen/login2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PASSBOOK SAMKHOK',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: login2(),
        debugShowCheckedModeBanner: false,
        );
  }
}

