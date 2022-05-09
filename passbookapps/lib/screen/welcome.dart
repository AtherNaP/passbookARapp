// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import 'package:passbookapps/screen/login2.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Samkhok Guide Book",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          children: [
            
           Padding(padding: const EdgeInsets.all(8.0),
           child: Column(
             children: [
                Image.asset('assets/images/logo2.png',
                height: 400,
                width: 450,
                
            )
             ],
           ),)
          ],
        ),
      )
      
      
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
