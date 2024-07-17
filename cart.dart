import 'package:flutter/material.dart';

class Cart extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CartState() ;
}

class _CartState extends State<Cart>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Cart",style: TextStyle(fontFamily: "Ethnocentric",fontSize: 25,color: Colors.red),
      ),),
      body: Container(
        color: Colors.black,
      ),
    );
  }
}