import 'package:flutter/material.dart';
import 'package:passbookapps/gitf.dart';

class GitfDetail extends StatelessWidget {
  final assetPath, gitfprice,gitfname;

  GitfDetail({this.assetPath,this.gitfname,this.gitfprice});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: Text("Coupon",style: TextStyle(color: Colors.black),),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          
      ),
      body: ListView(
        children: [
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Gitf',style: TextStyle(
              fontSize: 42.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF17532)

            ),),),
            SizedBox(height: 15.0,),
            Hero(tag: assetPath,
             child: Image.asset(assetPath,
             height: 150.0,
             width: 100.0,
             fit: BoxFit.contain
             )
             ),
             SizedBox(height: 20.0,),
             Center(
               child: Text(gitfprice,
               style: TextStyle(
                 fontSize: 22.0,
                 fontWeight: FontWeight.bold,
                 color: Color(0xFF575E67),
                 
               ),),
             ),
             SizedBox(height: 10.0,),
             Center(
               child: Text(gitfname,
               style: TextStyle(
                 fontSize: 24.0,
                 color: Color(0xFF575E67),
                 
               ),),
             ),
             SizedBox(height: 20.0,),
             Center(
               child: Container(
                 width: MediaQuery.of(context).size.width-50.0,
                 child: Text('สินค้างานหัตถกรรมของชาวสาวโคก',
                 textAlign: TextAlign.center,
                 style :TextStyle(fontSize: 16.0,
                 color: Color(0xFFB4B8B9)

                 )),
               ),
             ),
             SizedBox(height: 20.0,),
             Center(
               child: Container(
                 width: MediaQuery.of(context).size.width-50.0,
                 height: 50.0,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(25.0),
                   color: Color(0xfff17532)
                 ),
                 child: Center(
                   child: Text('Add to cart',
                   style: TextStyle(
                     fontSize: 14.0,
                     fontWeight: FontWeight.bold,
                     color: Colors.white
                   ), ),
                 ),
               ),
             )

        ],
      ),
    );
  }
  
}