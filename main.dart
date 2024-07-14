import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_orders/cart.dart';
import 'package:food_orders/orders.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Orders',
      theme: ThemeData(
        fontFamily: "RobotoCondensed",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Orders Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late var myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode() ;
  }

  final search = TextEditingController();

  var arrDishes = [
    {
      "image" : "assets/images/biryani.png",
      "name" : "Biryani"
    },
    {
      "image" : "assets/images/cake.png",
      "name" : "Cake"
    },
    {
      "image" : "assets/images/chicken.png",
      "name" : "Chicken"
    },
    {
      "image" : "assets/images/pizza.png",
      "name" : "Pizza"
    },
    {
      "image" : "assets/images/burger.png",
      "name" : "Burger"
    },
    {
      "image" : "assets/images/dosa.png",
      "name" : "Dosa"
    },
    {
      "image" : "assets/images/rice.png",
      "name" : "Rice"
    },
    {
      "image" : "assets/images/Shawrma.png",
      "name" : "Shawarma"
    },
  ];
  var arrRestaurant = [
    {
      "image":"assets/images/zyaka.jpg",
      "name":"Zyaka Restaurant ",
      "variety":"Chinese & North Indian"
    },
    {
      "image":"assets/images/pizza.jpeg",
      "name":"Dominos",
      "variety":"Pizza & Coke"
    },
    {
      "image":"assets/images/Tandoori-Momos-2B.jpg",
      "name":"WoW Momos",
      "variety":"Veg & NonVeg"
    },
    {
      "image":"assets/images/burger-with-melted-cheese.jpeg",
      "name":"Burger King",
      "variety":"Burgers & Fries"
    },
    {
      "image":"assets/images/ice cream.jpeg",
      "name":"Kwality Walls",
      "variety":"Ice-Creams"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton:FloatingActionButton(
          backgroundColor: Colors.red,
          elevation: 4,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          onPressed: (){
            Navigator.push(context,  MaterialPageRoute(builder: (context)=> Cart()) );
          },
          child: Icon(Icons.shopping_cart,color: Colors.white,size: 35,weight: 45,),
        ) ,
        backgroundColor: Colors.grey.shade800,
        body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(height: 10,),
              Center(
                child: Text("FOOD ORDERS",style: TextStyle(fontSize: 30,fontFamily: "Ethnocentric",color: Colors.lightBlue,letterSpacing: 1),),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  SizedBox(width: 8,),
                  Container(
                    height: 45,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black),
                        boxShadow: [BoxShadow(color: Colors.black12,spreadRadius: 2,offset: Offset(.2,.2),blurRadius: 2)]
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 2,),
                        Container(
                          child:IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.red,)),
                        ),
                        Container(
                          color: Colors.white,
                          width: 1,
                          height: 25,
                        ),
                        SizedBox(width: 4,),
                        Container(
                          width: 230,
                          height: 40,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8,top: 8,bottom:8),
                            child: TextField(
                              focusNode: myFocusNode,
                              cursorHeight: 20,
                              cursorColor: Colors.white,
                              cursorWidth: 0.5,
                              onTapOutside: (e)=> myFocusNode.unfocus(),
                              style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),
                              controller: search,
                              decoration: InputDecoration.collapsed(
                                  hintText:"Search food or restaurant...",
                                  hintStyle: TextStyle(color: Colors.grey,fontSize: 15,fontFamily: "Wittgenstein",)
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.red,
                    child: IconButton(onPressed: (){
                      Navigator.push(context,  MaterialPageRoute(builder: (context)=> OrdersPage()) );
                    }, icon: Icon(Icons.shopping_bag,color: Colors.white,size: 30,)),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.transparent,
                  height:200,
                  child: Card(
                    child: Column(
                      children: [
                        Text("Today's Special",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w600),),
                        Container(
                          width: 400,
                          height: 100,
                          child: Image.asset("assets/images/ice cream.jpeg",),
                        ),
                        Text("Ice-Cream",style: TextStyle(fontWeight: FontWeight.w600),)
                      ],
                    ),
                  ),
                ),
              ),
              Container(height: 0.5,color: Colors.white,),
              Padding(
                padding: const EdgeInsets.only(left: 62,top: 8,bottom: 10),
                child: Text("WHAT ARE YOU LOOKING FOR?",style: TextStyle(color: Colors.grey,fontFamily: "Inter",fontWeight: FontWeight.w600,letterSpacing: 1),),
              ),
              Container(
                height: 80,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: arrDishes.map((value){
                      return Container(
                          height: 70,
                          width: 65,
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage(value['image'].toString()),
                              ),
                              Text(value['name'].toString(),style: TextStyle(fontSize: 12,color: Colors.white,fontFamily: "Inter"),)
                            ],
                          )
                      );
                    }
                    ).toList()
                ),
              ),
              Container(height: 0.5,color: Colors.white,),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 5,left: 110),
                child: Text("BRAND HIGHLIGHTS",style: TextStyle(color: Colors.grey,fontFamily: "Inter",fontWeight: FontWeight.w600,letterSpacing: 1),),
              ),
              Container(
                width: 400,
                height: 600,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children:arrRestaurant.map((e){
                    return Card(
                      elevation: 4,
                      margin: EdgeInsets.all(10),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(
                              height: 150,
                              width: 400,
                              child: Image(image: AssetImage(e['image'].toString()),fit: BoxFit.cover,)),
                          Text(e['name'].toString(),style: TextStyle(color: Colors.black,fontFamily: "Wittgenstein",fontSize: 30),),
                          Text(e['variety'].toString(),style: TextStyle(color: Colors.black,fontFamily: "Wittgenstein",fontSize: 15),),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

            ]
        )
    )
    ;
  }
}
