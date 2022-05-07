
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:passbookapps/screen/components/loading.dart';
import 'package:passbookapps/screen/home.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

  final GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Future.delayed(Duration(seconds: 5)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: loading(),
            theme: ThemeData(primarySwatch: Colors.blue),
            debugShowCheckedModeBanner: false,
          );
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            navigatorKey: navigatorkey,
            home: Home(),
            theme: ThemeData(primarySwatch: Colors.blue),
            debugShowCheckedModeBanner: false,
          );
        }
      },
    );
    // return MaterialApp(
    //     title: 'PASSBOOK SAMKHOK',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: loading(),
    //     debugShowCheckedModeBanner: false,
    //     );
  }
}

