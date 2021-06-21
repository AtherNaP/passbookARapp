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
  Profile profile = Profile(email: '', password: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

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
                  colors: [
                    Color(0xFF18583B),
                    Color(0xCC9DDDC0),
                    Color(0xFF18583B)
                  ],
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

                      // ส่วนหัวหัว REGISTER

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "REGISTER",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // ส่วนฟอร์มกรอกข้อมูล
                      Container(
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 6,
                                          offset: Offset(0, 2))
                                    ],
                                  ),
                                  height: 52,
                                  width: 310,
                                  child: TextFormField(
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: "โปรดระบุอีเมลของท่าน"),
                                      EmailValidator(
                                          errorText: "รูปแบบอีเมลไม่ถูกต้อง")
                                    ]),
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(color: Colors.black87),
                                    onSaved: (email) {
                                      profile.email = email!;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(top: 14),
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Color(0xFF18583B),
                                        ),
                                        hintText: 'Email',
                                        hintStyle:
                                            TextStyle(color: Colors.black38)),
                                  )),
                              SizedBox(
                                height: 17,
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 6,
                                          offset: Offset(0, 2))
                                    ],
                                  ),
                                  height: 52,
                                  width: 310,
                                  child: TextFormField(
                                    validator: RequiredValidator(
                                        errorText: "โปรดระบุ Password ของท่าน"),
                                    obscureText: true,
                                    style: TextStyle(color: Colors.black87),
                                    onSaved: (password) {
                                      profile.password = password!;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding:
                                            EdgeInsets.only(top: 14),
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Color(0xFF18583B),
                                        ),
                                        hintText: 'Password',
                                        hintStyle:
                                            TextStyle(color: Colors.black38)),
                                  )),
                            ],
                          ),
                        ),
                      ),

                      //ส่วนของปุ่มกด Register
                      SizedBox(height: 50),
                      Column(
                        children: [
                          SizedBox(
                            width: 358,
                            height: 47,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color(0xFFFFFEFE)),
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
                                        Fluttertoast.showToast(
                                            msg: "สร้างบัญชีผู้ใช้เรียบร้อย",
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
                                            "มีอีเมลนี้ในระบบแล้ว โปรดใช้อีเมลอื่น";
                                      } else if (e.code == 'weak-password') {
                                        message =
                                            "รหัสผ่านต้องมีความยาว 6 ตัวอักษรขึ้นไป";
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
                                },
                                child: Text(
                                  "REGISTER",
                                  style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF18553A)),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      //ส่วนของปุ่มย้อนไปหน้า LOGIN
                      Column(children: [
                        SizedBox(
                          width: 358,
                          height: 47,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFA35B3B)),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => login2()));
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 36, fontWeight: FontWeight.bold),
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
