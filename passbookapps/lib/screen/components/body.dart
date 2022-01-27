import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:passbookapps/screen/login2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Body extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  CollectionReference tbtest = FirebaseFirestore.instance.collection('users');

  // void show_data(String user) {
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc('7r7EI5Sqcxtdc699YlEY')
  //       .update({'username': user});
  // }

  String myEmail = '';
  String myuser = '';

  show_data() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        myEmail = ds.data()!['email'];
        myuser = ds.data()!['username'];
        print(myEmail);
      }).catchError((e) {
        print(e);
      });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            SizedBox(height: 20),
            SizedBox(
              height: 150,
              width: 150,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  ),
                  SizedBox(
                    height: 46,
                    width: 46,
                    child: FlatButton(
                        onPressed: () {}, child: Container() //camera.icon
                        ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 20),
            // Container(
            //   child: Column(
            //     children: [
            //       Text(
            //         " " + myuser,
            //         style: TextStyle(
            //             color: Colors.black,
            //             fontSize: 24,
            //             fontWeight: FontWeight.w600),
            //       )
            //     ],
            //   ),
            // ),
            SizedBox(height: 20),
            Container(
              //color: Colors.red,
              height: 150,
              child: FutureBuilder(
                  future: show_data(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person_outline),
                            Text(' Username : ' + myuser,
                            style:TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w600
                            ) ,),
                            
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                            Icon(Icons.mail),
                            Text('  email : ' + myEmail)
                            ,],
                        )
                      ],
                    ));
                  }),
                  

              // StreamBuilder(
              //     stream: FirebaseFirestore.instance
              //         .collection('users')
              //         .doc('')
              //         .snapshots(),
              //     builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              //       print(snapshot.data!.toString());
              //       if (!snapshot.hasData) {
              //         return Center(child: CircularProgressIndicator());
              //       }
              //       return ListView.builder(
              //           itemCount: 1,
              //           itemBuilder: (context, index) {
              //             return Container(
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     //Text('username : '+snapshot.data!['username'].toString()),
              //                     Text('Email: '+myEmail)
              //                   ],
              //                 ),
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                   //Text('email : '+snapshot.data!['email'].toString())
              //                 ],)
              //               ],
              //             ));
              //           });
              //     }),
            ),
            SizedBox(height: 100),
            Center(
                child: Column(
              children: [
                // profilemenu(
                //     text: 'MyAccount',
                //     icon: Icons.person,
                //     press: () {}),
                // profilemenu(
                //     text: 'Notification',
                //     icon: Icons.notifications,
                //     press: () {}),
                profilemenu(
                    text: 'Log Out',
                    icon: Icons.logout,
                    press: () {
                      auth.signOut().then((value) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return login2();
                        }));
                      });
                    }),
              ],
            ))
          ],
        ),
      ],
    );
  }
}

class profilemenu extends StatelessWidget {
  const profilemenu(
      {Key? key, required this.text, required this.icon, required this.press})
      : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 100, vertical: 15), // ขนาดความใหญ่ยาว แถบเมนูปุ่ม
      child: FlatButton(
        padding: EdgeInsets.all(15), // ขนาดแถบเมนูปุ่ม
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.red[300],
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black, //Color icon
            ),
            SizedBox(
              // ตำแหน่งของข้อความในปุ่มเมนู
              width: 25,
            ),
            Expanded(
                child: Text(
              text,
              style: TextStyle(color: Colors.black), // color text
            )),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
