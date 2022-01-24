import 'package:flutter/material.dart';

class checkin extends StatefulWidget {
  @override
  _checkinState createState() => _checkinState();
}

class _checkinState extends State<checkin> {
  var CheckinList = [
    "เจดีย์พระยากราย",
    "พระอุโบสถเก่า",
    "วิหารน้อย",
    "เจดีย์ย่อมุมไม้สิบสอง",
    "ศาลาดิน",
    "โบราณสถานเตาโอ่งอ่าง",
    "กุฎิโบราณ",
    
  ];

  var descList = [
    "ลักษณะของโกศมีขนาดใหญ่ สร้างตามรูปแบบศิลปะมอญผสมไทย ก่อด้วยอิฐฉาบปูนรูปแบบโกศโถทรงกระบอกกลมปากผาย ฝายอดปริกปูนปั้นประดับกระจกอย่างประณีตงดงาม ฐานเหลี่ยมย่อมุมตกแต่งด้วยลวดลายปูนปั้นประดับด้วยลายบัวแวง ลายหน้ากระดานประจำยามก้ามปู",
    "เป็นสถานที่ศักดิ์สิทธิ์มีสิ่งสวยงามมากมาย ซึ่งมีอายุรวมรวม 300ปี สร้างสมัยอยุธยาตอนกลาง มีการบูรณะครั้งใหญ่สมัยต้นกรุงรัตนโกสินธิ์  เป็นอาคารที่ใช้ในการทำสังฆกรรมประกอบด้วยกำแพงแก้วล้อมรอบ ด้านในกำแพงก่อเป็นช่องสามเหลี่ยมใกล้พื้นที่โดยรอบ พื้นที่โดยรอบปูด้วยศิลา ทางเข้าทำเป็นซุ้มโครงก่ออิฐแบบกูบช้าง ทั้งด้านหน้าและด้านหลังศิลปะแบบอยุธยา ",
    "ในพระวิหารน้อยมีหลวงพ่อพุทธสิริมาแสนเป็นพระประธาน ประจำทิศตะวันตกประดิษฐานภายในวิหารน้อย เป็นพระพุทธรูปขนาดใหญ่ สร้างจากศิลาทรายแดง ปางมารวิชัย",
    "ย่อมุม ว่าหมายถึง ทำให้มุมของผังพื้นหรือวัตถุ เช่น แท่น ฐาน เสา ลึกเข้าไปทางด้านในเป็นมุม 90 องศา",
    "วิหารโถง (ศาลาดิน) เป็นอาคารทรงไทยจั่วลูกฟักหน้าพรม มีมาลัยโดยรอบ มุงด้วยกระเบื้องเชิงชายทำเป็นบันแถลงรูปสามเหลี่ยมปลายเรียวโค้งรูปเทพพนมสลับกับรูปดอกบัวอ่อนช้อยสวยงาม",
    "บริเวณด้านนอกของวัดสิงห์ จะมีเนินโคกเตาให้ได้ชมกัน ซึ่งเป็นที่มาของชื่ออำเภอสามโคกนั่นเอง ในอดีตมีเตาเผาสามโคกตั้งเรียงรายกัน โคกที่สามถูกรถไถเกรดเนินโคกเตา",
    "เป็นอาคารเก่าแก่สร้างในสมัยอยุธยาที่ยังคงสภาพค่อนข้างสมบูรณ์ และเป็นแบบอย่างอาคารที่คนไทยรับเทคนิคการก่อสร้างอาคารจากต่างชาติที่เข้ามาในสมัยอยุธยา",
    
  ];

  var imgList = [
    "assets/images/checkin1.png",
    "assets/images/C2.png",
    "assets/images/C7.jpg",
    "assets/images/C5.jpg",
    "assets/images/C3.jpg",
    "assets/images/C6.jpg",
    "assets/images/C4.jpg",
    
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Check In",style: TextStyle(color: Colors.black),),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: ListView.builder(
            itemCount: imgList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  showDialogFunc(context, imgList[index], CheckinList[index],
                      descList[index]);
                },
                child: Card(
                    child: Row(children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(imgList[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          CheckinList[index],
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF18583B),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          child: Text(
                            descList[index],
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[850],
                            ),
                          ),
                        )
                        
                      ],
                    ),
                  )
                ])),
              );
            },
          )),
    );
  }
}

showDialogFunc(context, img, chk, desc) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              padding: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 450,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      img,
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    chk,
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF18583B),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
