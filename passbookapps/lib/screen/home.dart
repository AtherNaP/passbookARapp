import 'package:flutter/material.dart';
import 'package:passbookapps/screen/listview.dart';
import 'package:passbookapps/screen/components/view.dart';
import 'package:passbookapps/screen/coupon.dart';
import 'package:passbookapps/screen/maps.dart';
import 'package:passbookapps/screen/profileuser.dart';
import 'package:passbookapps/screen/AR.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Properties
  int currentTab = 0;
  final List<Widget> screen = [
    maps(),
    listview(),
    profileuser(),
    // coupon(),
    // Arbody(),
    viewbody()
  ]; // to store tab view

  //Active Page (TAB)

  Widget currentScreen = maps(); // initial screen in viewport
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable;

    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),

      // FAB button
      floatingActionButton: Container(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              currentScreen = viewbody();

            });
            startScan(){

            }
          },
        child: Icon(
          Icons.view_in_ar
          ,
          size: 40,
        ),
        backgroundColor: Color(0xFF18583B),
        
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // bottom App Bar

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                children: <Widget>[
                  //
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = maps();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.map,
                          size: 30,
                          color:
                              currentTab == 0 ? Color(0xFF18583B) : Colors.grey,
                        ),
                        Text(
                          "Maps",
                          style: TextStyle(
                              color: currentTab == 0
                                  ? Color(0xFF18583B)
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
                  //
                  
                ],
              ),
              Row(

              ),
              Row(
                
              ),
              Row(
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = listview();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.room,
                          size: 30,
                          color:
                              currentTab == 1 ? Color(0xFF18583B) : Colors.grey,
                        ),
                        Text(
                          "Check In",
                          style: TextStyle(
                              color: currentTab == 1
                                  ? Color(0xFF18583B)
                                  : Colors.grey),
                        )
                      ],
                    ),
                  ),
              //     //
              //     MaterialButton(
              //       minWidth: 40,
              //       onPressed: () {
              //         setState(() {
              //           currentScreen = viewbody();
              //           currentTab = 2;
              //         });
              //       },
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: <Widget>[
              //           Icon(
              //             Icons.view_in_ar,
              //             color:
              //                 currentTab == 2 ? Color(0xFF18583B) : Colors.grey,
              //           ),
              //           Text(
              //             "AR",
              //             style: TextStyle(
              //                 color: currentTab == 2
              //                     ? Color(0xFF18583B)
              //                     : Colors.grey),
              //           )
              //         ],
              //       ),
              //     ),
              //     //
              //     MaterialButton(
              //       minWidth: 40,
              //       onPressed: () {
              //         setState(() {
              //           currentScreen = profileuser();
              //           currentTab = 3;
              //         });
              //       },
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: <Widget>[
              //           Icon(
              //             Icons.person,
              //             color:
              //                 currentTab == 3 ? Color(0xFF18583B) : Colors.grey,
              //           ),
              //           Text(
              //             "Profile",
              //             style: TextStyle(
              //                 color: currentTab == 3
              //                     ? Color(0xFF18583B)
              //                     : Colors.grey),
              //           )
              //         ],
              //       ),
              //     ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
