import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:passbookapps/screen/login2.dart';

class WelcomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var email = auth.currentUser!.email;
    return Scaffold(
      appBar: AppBar(
        title: Text("ยินดีต้อนรับจ้า"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Text(
                email!,
                style: TextStyle(fontSize: 25),
              ),
              ElevatedButton(
                  onPressed: () {
                    auth.signOut().then((value) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return login2();
                      }));
                    });
                  },
                  child: Text("ออกจากระบบ"))
            ],
          ),
        ),
      ),
    );
  }
}
