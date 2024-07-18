import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_orders/Cart/cart_provider.dart';
import 'package:provider/provider.dart';

class Restaurant extends StatelessWidget {

  final List data;

  Map<dynamic, dynamic> newData = {} ;


  Restaurant({key, required this.data}) :super(key: key) {
    newData = data.fold({}, (previousValue, element) {
      previousValue.addAll(element);
      return previousValue;
    });
  }

  Widget getConditionalIcon(bool condition) {
    if (condition) {
      return Row(
        children: [
          Card(child: Icon(Icons.circle_sharp, color: Colors.green, size: 10)),
          SizedBox(width: 2,),
          Container(width: 1,height: 10,color: Colors.white,),
          SizedBox(width: 4,),
          Text("PURE VEG",style: TextStyle(color: Colors.white,fontFamily: "Inter",fontSize: 12),)
        ],
      );
    } else {
      return Row(
        children: [
          Card(child: Icon(Icons.circle_sharp, color: Colors.red, size: 10)),
          SizedBox(width: 2,),
          Container(width: 1,height: 10,color: Colors.white,),
          SizedBox(width: 4,),
          Text("NON-VEG",style: TextStyle(color: Colors.white,fontFamily: "Inter",fontSize: 12),)
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text("Restaurants", style: TextStyle(
            color: Colors.red, fontSize: 25, fontFamily: "Ethnocentric"),),
      ),
      body: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 10,
            shadowColor: Colors.red,
            margin: EdgeInsets.all(8),
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: 400,
                  child: Image.asset(newData['image'], fit: BoxFit.fitWidth,),
                ),
                Positioned(
                  top: 130,
                  child: Container(
                    width: 385,
                    height: 70,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 17),
                          child: Text(newData['name'], style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: "Inter"),),
                        ),
                        Text(newData['variety'], style: TextStyle(color: Colors
                            .white, fontSize: 10, fontFamily: "Inter"),)
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.6),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))
                    ),
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 160,
                  child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(newData['Logo'])
                  ),
                )

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(color: Colors.grey, height: 1,),
          ),
          Text("RECOMMENDED FOR YOU", style: TextStyle(color: Colors.white,
              fontFamily: "Inter",
              fontSize: 16,
              letterSpacing: 2),),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: newData['Menu'].map<Widget>((info) {
                var mappedInfo = info as Map;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(),
                    elevation: 5,
                    shadowColor: Colors.red,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8,top: 1,left: 1),
                          child: Container(
                            height: 130,
                            width: 220,
                            color: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3, left: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getConditionalIcon(mappedInfo['isVeg']),
                                  Text(mappedInfo['Name'], style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontFamily: 'Inter'),),
                                  Text("₹ ${mappedInfo['Price']}",
                                    style: TextStyle(color: Colors.white,
                                        fontSize: 13,
                                        fontFamily: 'Inter'),),
                                  Text(mappedInfo['desciption'],
                                    style: TextStyle(color: Colors.white,
                                        fontSize: 11,
                                        fontFamily: "Inter"),)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAlias,
                          color: Colors.black,
                          child: Container(
                            height: 130,
                            width: 130,
                            child: Stack(
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  height: 100,
                                    width: 140,
                                    child: Image.asset(mappedInfo['photo'],fit: BoxFit.fitWidth)
                                ),
                                Positioned(
                                  top: 90,
                                  left: 22,
                                  child: InkWell(
                                    onTap: (){
                                      final cartProvider =
                                      Provider.of<CartProvider>(context,
                                          listen: false);
                                      cartProvider.addItem(CartItem(
                                        name: mappedInfo['Name'],
                                        price: mappedInfo['Price'],
                                        image: mappedInfo['photo'],
                                      ));
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text("Added to Card"),
                                          duration: Duration(seconds: 2),
                                        )
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8) ,
                                        color: Colors.grey.shade700.withOpacity(0.8),
                                      ),
                                      width: 85,
                                      height: 24,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.add,color: Colors.white,size: 15,),
                                          Text("Add",style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: "Inter"),)
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),

    );
  }
}

class MyWidget extends StatelessWidget {
  final bool condition;
MyWidget({Key? key, required this.condition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conditional Icons Example'),
      ),
      body: Center(
        child: condition ? Icon(Icons.check, color: Colors.green, size: 50)
                         : Icon(Icons.close, color: Colors.red, size: 50),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyWidget(condition: true), // Change to false to see the other icon
  ));
}
