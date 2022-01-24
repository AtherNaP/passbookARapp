import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Drink extends StatelessWidget {
@override
Widget build(BuildContext context){
  return Scaffold(
  backgroundColor: Color(0xFFFCFAF8),
  body: ListView(
    children: <Widget>[
      SizedBox(height: 15.0,),
      Container(
        padding: EdgeInsets.only(right: 15.0,),
        width: MediaQuery.of(context).size.width-30.0,
        height: MediaQuery.of(context).size.height-50.0,
        child: GridView.count(crossAxisCount:2,
        primary: false,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 15.0,
        childAspectRatio: 0.8,
        children: <Widget>[
          buildCard('น้ำตาลสด 1 เเก้ว', '30คะเเนน', 'assets/images/d1.png', true, false, context),
          buildCard('น้ำเเดงโซดา 1 เเก้ว', '30คะเเนน', 'assets/images/d2.png', true, false, context),
          buildCard('ชาดำมะนาว 1 เเก้ว', '30คะเเนน', 'assets/images/d1.png', true, false, context),
          buildCard('กาเเฟสามโคก 1 เเก้ส', '30คะเเนน', 'assets/images/d3.png', true, false, context),
          

        ],),
      ),
       SizedBox(height: 15.0,)
    ],
  ),
  );
  

  
}  
Widget buildCard(String name,String price,String imgPath,bool added,
  bool isFavorrite, context){
    return Padding(
      padding: EdgeInsets.only(top: 5.0,bottom: 5.0,left: 5.0,right: 5.0),
      child: InkWell(
        onTap: (){},
        child : Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0
              )
            ],
            color: Colors.white
          ),
          child:Column(
            children: [
              Hero(tag: imgPath , child: Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imgPath),
                    fit: BoxFit.contain)
                ),
              )
              ),
              SizedBox(height: 7.0,),
              Text(price,
              style: TextStyle(
                color: Colors.green,
                fontSize: 14.0),
              ),
              Text(name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0
              ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  color: Color(0xFFEBEBEB),
                  height: 1.0,
                ),),
              Padding(
                padding:EdgeInsets.only(left: 5.0,right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if(!added)...[
                      Icon(Icons.shopping_basket,
                      color: Color(0xFFD17E50),
                      size:12.0),
                      Text('Add to cart',
                      style:TextStyle(
                        color: Color(0xFFD17E50),
                        fontSize: 12.0
                      ),)
                    ],
                    if(added)...[
                      Icon(Icons.remove_circle_outline,
                      color: Color(0xFFD17E50),size: 12.0,),
                      Text('3',
                      style: TextStyle(
                        color: Color(0xFFD17E50),
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0
                      ),),
                      Icon(Icons.add_circle_outline,
                      color: Color(0xFFD17E50),size: 12.0),
                    ]
                  ],
                ), )   

            ],
          ),
        ),
      ),);
  }
}