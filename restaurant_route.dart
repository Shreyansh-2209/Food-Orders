import 'package:flutter/material.dart';
import 'package:food_orders/main.dart';
import 'package:food_orders/orders/orders.dart';
import 'package:food_orders/orders/orders_preparing.dart';
import '../restaurant.dart';

class RestaurantRoute{
  static Route<dynamic> generateRoute(RouteSettings settings){
    var args  = settings.arguments;

    switch (settings.name){
      case '/' :
        return MaterialPageRoute(builder: (_)=>MyHomePage());
      case '/stall1' :
        if (args is List){
          return MaterialPageRoute(builder: (_)=>Restaurant(data:args));
        }
        return _errorRoute();
      case '/stall2' :
        if (args is List){
          return MaterialPageRoute(builder: (_)=>Restaurant(data:args));
        }
        return _errorRoute();
      case '/stall3' :
        if (args is List){
          return MaterialPageRoute(builder: (_)=>Restaurant(data:args));
        }
        return _errorRoute();
      case '/stall4' :
        if (args is List){
          return MaterialPageRoute(builder: (_)=>Restaurant(data:args));
        }
        return _errorRoute();
      case '/stall5' :
        if (args is List){
          return MaterialPageRoute(builder: (_)=>Restaurant(data:args));
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text("Error 404"),
        ),
        body:Text("Error 404") ,
      );
    });
  }
}

class OrdersRoute{
  static Route<dynamic> generateRoute(RouteSettings settings){
    var args  = settings.arguments;

    switch (settings.name){
      case '/' :
        return MaterialPageRoute(builder: (_)=>MyHomePage());
      case '/Preparing' :
        if (args is List<Map<dynamic,dynamic>>){
          return MaterialPageRoute(builder: (_)=>OrdersPage(data:args));
        }
        return _errorRoute();
      case '/Ready' :
        if (args is List<Map<dynamic,dynamic>>){
          return MaterialPageRoute(builder: (_)=>OrdersPage(data:args));
        }
        return _errorRoute();
      case '/Delivered' :
        if (args is List<Map<dynamic,dynamic>>){
          return MaterialPageRoute(builder: (_)=>OrdersPage(data:args));
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text("Error 404"),
        ),
        body:Text("Error 404") ,
      );
    });
  }
}



