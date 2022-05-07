import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:passbookapps/model/profile.dart';
import 'package:passbookapps/view_detail.dart';

class listview extends StatefulWidget {
  @override
  _listviewState createState() => _listviewState();
}

class _listviewState extends State<listview> {
  //List<Location> locations = []; //*** */

  @override
  void initState() {
    super.initState();
    // readAllData();
  }

  // Future<void> readAllData() async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   CollectionReference collectionReference = firestore.collection('locations');
  //   await collectionReference.snapshots().listen((response) {
  //     List<DocumentSnapshot> snapshots = response.docs;
  //     for (var snepshot in snapshots) {
  //       var snepshots; //*** */
  //       Location location = Location.fromMap(snepshots.data);
  //       setState(() {
  //         locutions.add(location);
  //       });
  //     }
  //   });
  // }

  Widget showimage(int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.5,
    );
  }

  Widget showlistview(int index) {
    return Row(
      children: <Widget>[
        showimage(index),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "ข้อมูลเเหล่งท่องเที่ยว",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              backgroundColor: Colors.green,
            //เปลี่ยนสี
              elevation: 10.0,
            ),
            body: StreamBuilder<QuerySnapshot<Object?>>(
                stream: FirebaseFirestore.instance
                    .collection('locations')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }

                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final data = snapshot.requireData;

                  return ListView.builder(
                      itemCount: data.size,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.lightGreen[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 10,
                          child: GestureDetector(
                            onTap: () {
                              print(data.docs[index]['name']);

                              Location locations = Location(
                                  name: data.docs[index]['name'],
                                  image: data.docs[index]['image'],
                                  description: data.docs[index]['description']);

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return view_detail(locations);
                              }));
                            },
                            child: Container(
                              child: Builder(builder: (context) {
                                return Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Image.network(
                                      data.docs[index]['image'],
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          data.docs[index]['name'],
                                          style: TextStyle(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ),
                        );
                      });
                })));
  }
}
