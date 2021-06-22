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
    "ตลาดโบราณ"
  ];

  var descList = [
    "เป็นสถานที่ศักดิ์สิทธิ์มีสิ่งสวยงามมากมาย",
    "เป็นสถานที่ศักดิ์สิทธิ์มีสิ่งสวยงามมากมาย",
    "เป็นสถานที่ศักดิ์สิทธิ์มีสิ่งสวยงามมากมาย",
    "เป็นสถานที่ศักดิ์สิทธิ์มีสิ่งสวยงามมากมาย",
    "เป็นสถานที่ศักดิ์สิทธิ์มีสิ่งสวยงามมากมาย",
    "เป็นสถานที่ศักดิ์สิทธิ์มีสิ่งสวยงามมากมาย",
    "เป็นสถานที่ศักดิ์สิทธิ์มีสิ่งสวยงามมากมาย",
    "เป็นสถานที่ศักดิ์สิทธิ์มีสิ่งสวยงามมากมาย",
  ];

  var imgList = [
    "assets/images/checkin1.png",
    "assets/images/checkin1.png",
    "assets/images/checkin1.png",
    "assets/images/checkin1.png",
    "assets/images/checkin1.png",
    "assets/images/checkin1.png",
    "assets/images/checkin1.png",
    "assets/images/checkin1.png",
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
        appBar: AppBar(
          title: Text("จุดเช็คอิน ณ วัดสิงห์"),
          backgroundColor: Color(0xFF18583B),
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
                  padding: const EdgeInsets.all(10.0),
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
                            color: Colors.grey[500],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ])),
            );
          },
        ));
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
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 450,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      img,
                      width: 150,
                      height: 150,
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
