import 'package:flutter/material.dart';

class loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<loading> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.white, Colors.lightGreen],
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
                      Image.asset(
                        'assets/images/logo2.jpg',
                        width: 240,
                        height: 181,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Guide Book",
                        style: TextStyle(
                            color: Colors.green[900],
                            fontSize: 32,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 170,
                ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Logo_MHESI.png',
                          width: 85,
                          height: 181,
                        ),
                         SizedBox(
                  width: 30,),
                        Image.asset(
                          'assets/images/logormutt.png',
                          width: 60,
                          height: 181,
                        ),
                         SizedBox(
                  width: 30,),
                        Image.asset(
                          'assets/images/SK.png',
                          width: 80,
                          height: 181,
                        ),
                        SizedBox(
                  width: 30,),
                        Image.asset(
                          'assets/images/U2T.png',
                          width: 80,
                          height: 181,
                        ),
                      ],
                    ),
                    SizedBox(
                  height: 10,),
                    Container(
                      child: Text(
                        "ส่วนหนึ่งของโครงการเสริมสร้างและพัฒนาศักยภาพการท่องเที่ยวเชิงวัฒนธรรมผลิตภัณฑ์พื้นถิ่น และการพัฒนาอาหารสำเร็จรูป \n สำหรับผู้ป่วยโรคเรื้อรังที่มีภาวะไตเสื่อมในชุมชน ตำบลสามโคกเพื่อการยกระดับเศรษฐกิจ สังคมเชิงบูรณาการแบบมีส่วนร่วม \n ภายใต้โครงการยกระดับเศรษฐกิจและสังคมรายตำบลแบบบูรณาการ (1 ตำบล 1 มหาวิทยาลัย)",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 7.6,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
