// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:passbookapps/drink.dart';
import 'package:passbookapps/food.dart';
import 'package:passbookapps/gitf.dart';
import 'package:passbookapps/screen/home.dart';

class coupon extends StatefulWidget {
  @override
  _couponState createState() => _couponState();
}

class _couponState extends State<coupon>
  with SingleTickerProviderStateMixin {
     late TabController tabController;

     @override
     void initState(){
       super.initState();
       tabController = TabController(length:3,vsync: this );
     }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Coupon",style: TextStyle(color: Colors.black),),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          
        ),
      body: ListView(
        padding: EdgeInsets.only(left: 10.0),
        children: <Widget>[
          SizedBox(
            height: 15.0, ),
          Text('ร้านค้าท้องถิ่น',style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold
          ),
        ),
        Text('คุณมี 999 คะเเนน',style: TextStyle(
          
          fontSize: 20.0,
        ),),
          SizedBox(height: 15.0),
          TabBar(
            controller: tabController,
            indicatorColor: Colors.transparent,
            labelColor: Color(0xFFC88D67),
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 45.0),
            unselectedLabelColor: Color(0xFFCDCDCD),
            tabs: [
              Tab(
                child: Text('ของฝาก สามโคก',
                style: TextStyle(
                  fontFamily: 'Schyler',
                  fontSize:21.0
                   ),),
              ),
              Tab(
                child: Text('เครื่องดื่ม',
                style: TextStyle(
                  fontFamily: 'Schyler',
                  fontSize:21.0
                   ),),
              ),
              Tab(
                child: Text('อาหาร',
                style: TextStyle(
                  fontFamily: 'Schyler',
                  fontSize:21.0
                   ),),
              ),
              

            ],),
          Container(
            height: MediaQuery.of(context).size.height-50.0,
            width: double.infinity,
            child: TabBarView(controller: tabController,
            children: [
              Gitf(),
              Drink(),
              Food(),
            ],),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   backgroundColor: Color(0xFFF17532),
      //   child: Icon(Icons.fastfood)
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      ),
     
    );
}
}
