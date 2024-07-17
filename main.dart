import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_orders/cart.dart';
import 'package:food_orders/orders.dart';
import 'package:food_orders/routes/restaurant_route.dart';
import 'package:food_orders/searchpage.dart';
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
      initialRoute: '/',
      onGenerateRoute: RestaurantRoute.generateRoute ,
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

  final search = TextEditingController();
  var arrDishes = [
    {"image": "assets/images/biryani.png", "name": "Biryani"},
    {"image": "assets/images/cake.png", "name": "Cake"},
    {"image": "assets/images/chicken.png", "name": "Chicken"},
    {"image": "assets/images/pizza.png", "name": "Pizza"},
    {"image": "assets/images/burger.png", "name": "Burger"},
    {"image": "assets/images/dosa.png", "name": "Dosa"},
    {"image": "assets/images/rice.png", "name": "Rice"},
    {"image": "assets/images/Shawrma.png", "name": "Shawarma"},
  ];
  var arrRestaurant = [
    {
      "image": "assets/images/zyaka.jpg",
      "name": "Zaika's Restaurant ",
      "variety": " CHINESE  |  NORTH INDIAN",
      "route": "/stall1",
      "details": [{
        "image": "assets/images/zyaka.jpg",
        "name": "Zaika's Restaurant ",
        "variety": " CHINESE  |  NORTH INDIAN",
        "Logo" : "assets/images/zyzka logo.jpg",
        "Menu" : [
          {
            "Name" : "Samosa",
            "Price" : 15,
            "photo" : "assets/images/samosa.jpg",
            "isVeg" : true ,
            "desciption": "Indulge in our savory samosa: crispy pastry, filled with spiced potatoes and peas, perfect with chutney."
        },
          {
            "Name" : "Paratha",
            "Price" : 25,
            "photo" : "assets/images/paratha.jpeg",
            "isVeg" : true ,
            "desciption": "Discover our delicious paratha: whole wheat, pan-fried, filled with spiced vegetables or paneer. "
        },
          {
            "Name" : "Samosa",
            "Price" : 15,
            "photo" : "assets/images/samosa.jpg",
            "isVeg" : true ,
            "desciption": "Indulge in our savory samosa: crispy pastry, filled with spiced potatoes and peas, perfect with chutney."
        },
          {
            "Name" : "Paratha",
            "Price" : 25,
            "photo" : "assets/images/paratha.jpeg",
            "isVeg" : true ,
            "desciption": "Discover our delicious paratha: whole wheat, pan-fried, filled with spiced vegetables or paneer. "
        },
          {
            "Name" : "Samosa",
            "Price" : 15,
            "photo" : "assets/images/samosa.jpg",
            "isVeg" : true,
            "desciption": "Indulge in our savory samosa: crispy pastry, filled with spiced potatoes and peas, perfect with chutney."
        },
          {
            "Name" : "Paratha",
            "Price" : 25,
            "photo" : "assets/images/paratha.jpeg",
            "isVeg" : true ,
            "desciption": "Discover our delicious paratha: whole wheat, pan-fried, filled with spiced vegetables or paneer. "
        },
        ]
      }]
    },
    {
      "image": "assets/images/pizza.jpeg",
      "name": "Dominos",
      "variety": " PIZZA  |  COKE ",
      "route": "/stall2",
      "details": [{
        "image": "assets/images/pizza.jpeg",
        "name": "Dominos",
        "variety": " PIZZA  |  COKE ",
        "Logo" : "assets/images/dominos logo.png",
        "Menu" : [
          {
            "Name" : "Panner Pizza",
            "Price" : 250,
            "photo" : "assets/images/paneer-pizza.jpg",
            "isVeg" : true ,
            "desciption": "Delicious paneer pizza with rich tomato sauce, fresh vegetables, creamy paneer, and golden crust perfection."
          },
          {
            "Name" : "Chicken Tikka Pizza",
            "Price" : 300,
            "photo" : "assets/images/chicken tikka pizza.jpg",
            "isVeg" : false ,
            "desciption": "Succulent chicken tikka,spicy sauce,melted cheese,and crispy crust for a mouthwatering delight."
          },
          {
            "Name" : "Panner Pizza",
            "Price" : 250,
            "photo" : "assets/images/paneer-pizza.jpg",
            "isVeg" : true ,
            "desciption": "Delicious paneer pizza with rich tomato sauce,fresh vegetables, creamy paneer, and golden crust perfection."
          },
          {
            "Name" : "Chicken Tikka Pizza",
            "Price" : 300,
            "photo" : "assets/images/chicken tikka pizza.jpg",
            "isVeg" : false ,
            "desciption": "Succulent chicken tikka,spicy sauce,melted cheese,and crispy crust for a mouthwatering delight."
          },
          {
            "Name" : "Panner Pizza",
            "Price" : 250,
            "photo" : "assets/images/paneer-pizza.jpg",
            "isVeg" : true,
            "desciption": "Delicious paneer pizza with rich tomato sauce, fresh vegetables, creamy paneer, and golden crust perfection."
          },
          {
            "Name" : "Chicken Tikka Pizza",
            "Price" : 300,
            "photo" : "assets/images/chicken tikka pizza.jpg",
            "isVeg" : false ,
            "desciption": "Succulent chicken tikka,spicy sauce,melted cheese,and crispy crust for a mouthwatering delight."
          },
        ]

      }]
    },
    {
      "image": "assets/images/Tandoori-Momos-2B.jpg",
      "name": "WoW Momos",
      "variety": "  VEG  |  NON - VEG",
      "route": "/stall3",
      "details": [{
        "image": "assets/images/Tandoori-Momos-2B.jpg",
        "name": "WoW Momos",
        "variety": "  VEG  |  NON - VEG",
        "Logo" : "assets/images/wow momos logo.jpg",
        "Menu" : [
          {
            "Name" : "Veg Momo",
            "Price" : 80,
            "photo" : "assets/images/veg momos.jpeg",
            "isVeg" : true ,
            "desciption": "Steamed dumplings filled with fresh vegetables, served with a spicy dipping sauce."
          },
          {
            "Name" : "Non-Veg Momo",
            "Price" : 100,
            "photo" : "assets/images/nonveg momo.jpg",
            "isVeg" : false ,
            "desciption": "Juicy meat-filled dumplings, steamed to perfection, accompanied by a tangy chili sauce."
          },
          {
            "Name" : "Veg Momo",
            "Price" : 80,
            "photo" : "assets/images/veg momos.jpeg",
            "isVeg" : true ,
            "desciption": "Steamed dumplings filled with fresh vegetables, served with a spicy dipping sauce."
          },
          {
            "Name" : "Non-Veg Momo",
            "Price" : 100,
            "photo" : "assets/images/nonveg momo.jpg",
            "isVeg" : false ,
            "desciption": "Juicy meat-filled dumplings, steamed to perfection, accompanied by a tangy chili sauce."
          },
          {
            "Name" : "Veg Momo",
            "Price" : 80,
            "photo" : "assets/images/veg momos.jpeg",
            "isVeg" : true ,
            "desciption": "Steamed dumplings filled with fresh vegetables, served with a spicy dipping sauce."
          },
          {
            "Name" : "Non-Veg Momo",
            "Price" : 100,
            "photo" : "assets/images/nonveg momo.jpg",
            "isVeg" : false ,
            "desciption": "Juicy meat-filled dumplings, steamed to perfection, accompanied by a tangy chili sauce."
          },
        ]
      }]
    },
    {
      "image": "assets/images/burger-with-melted-cheese.jpeg",
      "name": "Burger King",
      "variety": "BURGERS  |  FRIES",
      "route": "/stall4",
      "details": [{
        "image": "assets/images/burger-with-melted-cheese.jpeg",
        "name": "Burger King",
        "variety": "BURGERS  |  FRIES",
        "Logo" : "assets/images/burger king logo.png",
        "Menu" : [
          {
            "Name" : "Burger",
            "Price" : 60,
            "photo" : "assets/images/burger.jpg",
            "isVeg" : true,
            "desciption": "Juicy patty, fresh lettuce, tomatoes, pickles, and melted cheese in a soft bun."
          },
          {
            "Name" : "Fries",
            "Price" : 40,
            "photo" : "assets/images/fries.jpeg",
            "isVeg" : true,
            "desciption": "Golden, crispy potato fries, perfectly seasoned for a delightful crunch in every bite."
          },
          {
            "Name" : "Burger",
            "Price" : 60,
            "photo" : "assets/images/burger.jpg",
            "isVeg" : true ,
            "desciption": "Juicy patty, fresh lettuce, tomatoes, pickles, and melted cheese in a soft bun."
          },
          {
            "Name" : "Fries",
            "Price" : 40,
            "photo" : "assets/images/fries.jpeg",
            "isVeg" : true ,
            "desciption": "Golden, crispy potato fries, perfectly seasoned for a delightful crunch in every bite."
          },
          {
            "Name" : "Burger",
            "Price" : 60,
            "photo" : "assets/images/burger.jpg",
            "isVeg" : true ,
            "desciption": "Juicy patty, fresh lettuce, tomatoes, pickles, and melted cheese in a soft bun."
          },
          {
            "Name" : "Fries",
            "Price" : 40,
            "photo" : "assets/images/fries.jpeg",
            "isVeg" : true ,
            "desciption": "Golden, crispy potato fries, perfectly seasoned for a delightful crunch in every bite."
          },
        ]
      }]
    },
    {
      "image": "assets/images/ice cream.jpeg",
      "name": "Kwality Walls",
      "variety": " ICE - CREAMS  |  SHAKES",
      "route": "/stall5",
      "details": [{
        "image": "assets/images/ice cream.jpeg",
        "name": "Kwality Walls",
        "variety": " ICE - CREAMS  |  SHAKES",
        "Logo" : "assets/images/kwality walls icon.png",
        "Menu" : [
          {
            "Name" : "Ice-Creams",
            "Price" : 30,
            "photo" : "assets/images/ice-cream.jpg",
            "isVeg" : true ,
            "desciption": "Creamy, rich ice cream in various flavors, a perfect treat to cool you down."
          },
          {
            "Name" : "Shakes",
            "Price" : 50,
            "photo" : "assets/images/shakes.jpeg",
            "isVeg" : true ,
            "desciption": "Thick, creamy milkshakes in assorted flavors, blended to perfection for a refreshing treat."
          },
          {
            "Name" : "Ice-Creams",
            "Price" : 30,
            "photo" : "assets/images/ice-cream.jpg",
            "isVeg" : true,
            "desciption": "Creamy, rich ice cream in various flavors, a perfect treat to cool you down."
          },
          {
            "Name" : "Shakes",
            "Price" : 50,
            "photo" : "assets/images/shakes.jpeg",
            "isVeg" : true ,
            "desciption": "Thick, creamy milkshakes in assorted flavors, blended to perfection for a refreshing treat."
          },
          {
            "Name" : "Ice-Creams",
            "Price" : 30,
            "photo" : "assets/images/ice-cream.jpg",
            "isVeg" : true ,
            "desciption": "Creamy, rich ice cream in various flavors, a perfect treat to cool you down."
          },
          {
            "Name" : "Shakes",
            "Price" : 50,
            "photo" : "assets/images/shakes.jpeg",
            "isVeg" : true ,
            "desciption": "Thick, creamy milkshakes in assorted flavors, blended to perfection for a refreshing treat."
          },
        ]
      }]
    },
  ];

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
                context, MaterialPageRoute(builder: (context) => Cart()));
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
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Searchpage()));
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
                        padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                        child: TextField(
                          focusNode: myFocusNode,
                          cursorHeight: 25,
                          cursorColor: Colors.white,
                          cursorWidth: 0.5,
                          onTap: (){
                            myFocusNode.unfocus();
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Searchpage()));
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
                          SizedBox(height: 1,),
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
                  onTap:(){
                    Navigator.of(context).pushNamed(e['route'].toString(),arguments:e['details']);
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