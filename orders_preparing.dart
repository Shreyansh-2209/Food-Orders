import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_orders/restaurant_data.dart';

class OrdersPreparing extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Orders",style: TextStyle(fontFamily: "Ethnocentric",fontSize: 25,color: Colors.red),),
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: Orders.map((e){
          return Container(
            width: 400,
            height: 170,
            decoration: BoxDecoration(
              color: Colors.black
            ),
            child: Card(
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e["Stall"].toString(),style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: "Inter"),),
                    /*ListView(
                      children: (e['Data'] as List? ?? []).map((info){
                        return Column(
                          children: [
                          ],
                        ) ;
                      }).toList(),
                    )*/
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}