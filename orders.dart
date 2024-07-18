import 'package:flutter/material.dart';
import 'package:food_orders/main.dart';

class OrdersPage extends StatelessWidget{

  final List<Map<dynamic, dynamic>> data ;

  Map<dynamic, dynamic> newData = {} ;

  OrdersPage({key,required this.data}) : super(key: key){
    newData = data.fold({}, (previousValue, element) {
      previousValue.addAll(element);
      return previousValue;
    });
  }

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Card(
                    elevation: 4,
                    shadowColor: Colors.red,
                    child: Container(
                      width: 180,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(color: Colors.red,blurRadius: 4,offset: Offset(1,0))]
                      ),
                      child: Center(child: Text("Orders Preparing",style: TextStyle(color: Colors.black,fontFamily: "Inter",fontSize: 20),textAlign: TextAlign.center,)),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Card(
                    elevation: 4,
                    shadowColor: Colors.red,
                    child: Container(
                      width: 180,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(color: Colors.red,blurRadius: 4,offset: Offset(1,0))]
                      ),
                      child: Center(child: Text("Orders Ready",style: TextStyle(color: Colors.black,fontFamily: "Inter",fontSize: 20),textAlign: TextAlign.center,)),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Card(
                    elevation: 4,
                    shadowColor: Colors.red,
                    child: Container(
                      width: 180,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(color: Colors.red,blurRadius: 4,offset: Offset(1,0))]
                      ),
                      child: Center(child: Text("Orders Delivered",style: TextStyle(color: Colors.black,fontFamily: "Inter",fontSize: 20),textAlign: TextAlign.center,)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: 1,color: Colors.white,),
            ),
            SizedBox(height: 100,),
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 10,
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.black,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Image(image: AssetImage("assets/images/no orders.png")),
                ),
              ),
            Text("No Orders Yet",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30,fontFamily: "Inder"),),
            SizedBox(height: 40,),
            InkWell(
              onTap: (){
                Navigator.push((context),MaterialPageRoute(builder: (builder)=>MyHomePage()));
              },
              child: Container(
                width: 180,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(child: Text("Explore Food",style: TextStyle(color: Colors.red,fontFamily: "Inter",fontSize: 20),textAlign:TextAlign.center,)),
              ),
            )
          ],
        ),
      )
    );
  }
}