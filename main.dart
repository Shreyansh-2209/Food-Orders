import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_orders/cart.dart';
import 'package:food_orders/cart_provider.dart';
import 'package:food_orders/orders.dart';
import 'package:food_orders/restaurant_route.dart';
import 'package:food_orders/searchpage.dart';
import 'package:provider/provider.dart';
import 'package:food_orders/restaurant_data.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => CartProvider(),
    child: MyApp(),
  ));
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
      initialRoute: '/',
      onGenerateRoute: RestaurantRoute.generateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late var myFocusNode = FocusNode();
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage()));
          },
          child: Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 35,
            weight: 45,
          ),
        ),
        //backgroundColor: Color(0xFF252525),
        backgroundColor: Colors.transparent,
        body: ListView(scrollDirection: Axis.vertical, children: [
          Center(
            child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                          colors: [
                            Colors.red.withOpacity(_animation.value),
                            Colors.blue.withOpacity(1 - _animation.value),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(rect);
                      },
                      child: Text(
                        "FOOD ORDERS",
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: "Ethnocentric",
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ));
                }),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SizedBox(
                width: 8,
              ),
              Container(
                height: 45,
                width: 315,
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
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Searchpage()));
                          },
                          icon: Icon(
                            Icons.search,
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
                      width: 230,
                      height: 40,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                        child: TextField(
                          focusNode: myFocusNode,
                          cursorHeight: 25,
                          cursorColor: Colors.white,
                          cursorWidth: 0.5,
                          onTap: () {
                            myFocusNode.unfocus();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Searchpage()));
                          },
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
                                  fontSize: 12,
                                  fontFamily: "Inter",
                                  letterSpacing: 1.2)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.red,
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrdersPage()));
                    },
                    icon: Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.transparent,
              height: 200,
              child: Card(
                child: Column(
                  children: [
                    Text(
                      "Today's Special",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      width: 400,
                      height: 100,
                      child: Image.asset(
                        "assets/images/ice cream.jpeg",
                      ),
                    ),
                    Text(
                      "ICE - CREAM",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: "Inter",
                          letterSpacing: 1),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 0.2,
            width: 200,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 62, top: 8, bottom: 10),
            child: Text(
              "WHAT ARE YOU LOOKING FOR?",
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3),
            ),
          ),
          Container(
            height: 80,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: arrDishes.map((value) {
                  return Container(
                      height: 90,
                      width: 85,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                AssetImage(value['image'].toString()),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Text(
                            value['name'].toString(),
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: "Inter"),
                          )
                        ],
                      ));
                }).toList()),
          ),
          Container(
            height: 0.2,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5, left: 110),
            child: Text(
              "BRAND HIGHLIGHTS",
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3),
            ),
          ),
          Container(
            width: 400,
            height: 400,
            child: ListView(
              children: arrRestaurant.map((e) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(e['route'].toString(),
                        arguments: e['details']);
                  },
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.all(10),
                    clipBehavior: Clip.antiAlias,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                            height: 150,
                            width: 400,
                            child: Image(
                              image: AssetImage(e['image'].toString()),
                              fit: BoxFit.cover,
                            )),
                        Text(
                          e['name'].toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              letterSpacing: 0.3),
                        ),
                        Text(
                          e['variety'].toString(),
                          style: TextStyle(
                              color: Color(0xFF242323),
                              fontFamily: "Inter",
                              fontSize: 13,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ]));
  }
}
