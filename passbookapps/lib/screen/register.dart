import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:passbookapps/model/profile.dart';

import 'login2.dart';

@override
// ignore: camel_case_types
// ignore: must_be_immutable
class register extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '', user: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  // void regadddata(String uidvalue) {
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .add({
  //         'email': profile.email,
  //         'password': profile.password,
  //         'username': profile.user,
  //         'uid': uidvalue,
  //       })
  //       .then((value) => print('insert data successful'))
  //       .catchError((error) => print("Failed to merge data: $error"));
  // }

  void regadddata(String uidvalue) async {
    var firebaseUser = await FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('users')
    .doc(firebaseUser!.uid)
    .set({
      'email': profile.email,
          'password': profile.password,
          'username': profile.user,
          'uid': uidvalue,
    }).then((value) => print('insert data successful uid: $uidvalue'))
        .catchError((error) => print("Failed to merge data: $error"));
  }

  // void addregister(String email, String password, String user) async {
  //   await users.add({'email' : email,'password': password, 'username' : user}).then((value) => print('insert data to firebase successful'));
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, 
                  Colors.white, 
                  Colors.lightGreen],
                )),
                child: Scaffold(
                    backgroundColor: Colors.white.withOpacity(0.0),
                    body: SafeArea(
                        child: SingleChildScrollView(
                            child: Column(children: [
                      Container(
                        child: SizedBox(
                          height: 100,
                        ),
                      ),

                      // ?????????????????????????????? REGISTER
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/logo2.jpg',
                              width: 250,
                              height: 181,
                            ),
                          ],
                        ),
                      ),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "REGISTER",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // ?????????????????????????????????????????????????????????
                      Container(
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Container(
                                  //?????????????????????Usernamre
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(right: 70, left: 70),
                                  child: TextFormField(
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: "?????????????????????????????????????????????????????????"),
                                    ]),
                                    style: TextStyle(color: Colors.black87),
                                    onSaved: (User) {
                                      profile.user = User!;
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(top: 14),
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Colors.green,
                                        ),
                                        hintText: 'Username',
                                        hintStyle:
                                            TextStyle(color: Colors.black38)),
                                  )),
                              SizedBox(
                                height: 17,
                              ),
                              Container(
                                  //??????????????????????????????
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(right: 70, left: 70),
                                  child: TextFormField(
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: "????????????????????????????????????????????????????????????"),
                                      EmailValidator(
                                          errorText: "???????????????????????????????????????????????????????????????")
                                    ]),
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(color: Colors.black87),
                                    onSaved: (email) {
                                      profile.email = email!;
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(top: 14),
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Colors.green,
                                        ),
                                        hintText: 'Email',
                                        hintStyle:
                                            TextStyle(color: Colors.black38)),
                                  )),
                              SizedBox(
                                height: 17,
                              ),
                              Container(
                                  //?????????????????????????????????
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(right: 70, left: 70),
                                  child: TextFormField(
                                    validator: RequiredValidator(
                                        errorText: "???????????????????????? Password ?????????????????????"),
                                    obscureText: true,
                                    style: TextStyle(color: Colors.black87),
                                    onSaved: (password) {
                                      profile.password = password!;
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        contentPadding:
                                            EdgeInsets.only(top: 14),
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Colors.green,
                                        ),
                                        hintText: 'Password',
                                        hintStyle:
                                            TextStyle(color: Colors.black38)),
                                  )),
                            ],
                          ),
                        ),
                      ),

                      //??????????????????????????????????????? Register
                      SizedBox(height: 50),
                      Column(
                        children: [
                          SizedBox(
                            width: 300,
                            height: 47,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.redAccent),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ))),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    try {
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: profile.email,
                                              password: profile.password)
                                          .then((value) {
                                        formKey.currentState!.reset();
                                        regadddata(value.user!.uid);
                                        Fluttertoast.showToast(
                                            msg: "???????????????????????????????????????????????????????????????????????????",
                                            gravity: ToastGravity.CENTER);
                                        formKey.currentState!.reset();
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return login2();
                                        }));
                                      });
                                      // ignore: unused_catch_clause
                                    } on FirebaseAuthException catch (e) {
                                      // ignore: unused_local_variable
                                      var message;
                                      if (e.code == 'email-already-in-use') {
                                        message =
                                            "???????????????????????????????????????????????????????????? ????????????????????????????????????????????????";
                                      } else if (e.code == 'weak-password') {
                                        message =
                                            "??????????????????????????????????????????????????????????????? 6 ??????????????????????????????????????????";
                                      } else {
                                        message = e.message;
                                      }
                                      print(e.code);
                                      //print(e.message);
                                      Fluttertoast.showToast(
                                          msg: message,
                                          gravity: ToastGravity.CENTER);
                                    }
                                  }
                                  print('4');
                                  print(profile.email);
                                  print(profile.password);
                                  print(profile.user);

                                  
                                  //await users.add({'email' : profile.email,'password': profile.password, 'username' : profile.user}).then((value) => print('insert data to firebase successful'));
                                },
                                child: Text(
                                  "REGISTER",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      //??????????????????????????????????????????????????????????????? LOGIN
                      Column(children: [
                        SizedBox(
                          width: 300,
                          height: 47,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ))),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => login2()));
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )),
                        )
                      ]),
                    ])))),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
