import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _OrdersPageState() ;
}

class _OrdersPageState extends State<OrdersPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Orders",style: TextStyle(fontFamily: "Ethnocentric",fontSize: 25,color: Colors.red),),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
      ),
    );
  }
}