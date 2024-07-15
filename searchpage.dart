import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_orders/main.dart';

class Searchpage extends StatefulWidget{
  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {

  late var myFocusNode = FocusNode();
  final search = TextEditingController();

  var arrDishes = [
    {"image": "assets/images/biryani.png", "name": "Biryani"},
    {"image": "assets/images/cake.png", "name": "Cake"},
    {"image": "assets/images/chicken.png", "name": "Chicken"},
    {"image": "assets/images/pizza.png", "name": "Pizza"},
    {"image": "assets/images/burger.png", "name": "Burger"},
    {"image": "assets/images/dosa.png", "name": "Dosa"},
    {"image": "assets/images/rice.png", "name": "Rice"},
    {"image": "assets/images/Shawrma.png", "name": "Shawarma"},{"image": "assets/images/biryani.png", "name": "Biryani"},
    {"image": "assets/images/cake.png", "name": "Cake"},
    {"image": "assets/images/chicken.png", "name": "Chicken"},
    {"image": "assets/images/pizza.png", "name": "Pizza"},
    {"image": "assets/images/burger.png", "name": "Burger"},
    {"image": "assets/images/dosa.png", "name": "Dosa"},
    {"image": "assets/images/rice.png", "name": "Rice"},
    {"image": "assets/images/Shawrma.png", "name": "Shawarma"},{"image": "assets/images/biryani.png", "name": "Biryani"},
    {"image": "assets/images/cake.png", "name": "Cake"},
    {"image": "assets/images/chicken.png", "name": "Chicken"},
    {"image": "assets/images/pizza.png", "name": "Pizza"},
    {"image": "assets/images/burger.png", "name": "Burger"},
    {"image": "assets/images/dosa.png", "name": "Dosa"},
    {"image": "assets/images/rice.png", "name": "Rice"},
    {"image": "assets/images/Shawrma.png", "name": "Shawarma"},
  ];

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Row(
              children: [
                SizedBox(
                  width: 8,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            offset: Offset(.2, .2),
                            blurRadius: 2)
                      ]),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 2,
                      ),
                      Container(
                        child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                            },
                            icon: Icon(
                              Icons.arrow_circle_left_sharp,
                              size: 30,
                              color: Colors.red,
                            )),
                      ),
                      Container(
                        color: Colors.white54,
                        width: 1,
                        height: 25,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        width:320,
                        height: 45,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, top: 11, bottom: 11),
                          child: TextField(

                            focusNode: myFocusNode,
                            cursorHeight: 25,
                            cursorColor: Colors.white,
                            cursorWidth: 0.5,
                            onTapOutside: (e) => myFocusNode.unfocus(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                            controller: search,
                            decoration: InputDecoration.collapsed(
                                hintText: "Search food or restaurant...",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: "Inter",
                                    letterSpacing: 1.2)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 2),
            child: Container(height: 2,color: Colors.grey.shade600,),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8,top: 5),
            child: Text("TOP PICKS FOR YOU",style: TextStyle(color: Colors.grey, fontFamily: "Inter", fontWeight: FontWeight.w400, letterSpacing: 3,fontSize: 18),),
          ),
          Expanded(
            child: GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 3,
              children: arrDishes.map((toElement){
                return Container(
                        height: 100,
                        width: 100,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                              AssetImage(toElement['image'].toString()),
                            ),
                            Text(
                              toElement['name'].toString(),
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontFamily: "Inter"),
                            )
                          ],
                        )
                );
                  }).toList(),
                  )
              ),

        ],
      )
    );
  }
}