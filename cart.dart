import 'package:flutter/material.dart';
import 'package:food_orders/payment_succesful.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
class CartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'CART',
          style: TextStyle(
              color: Colors.red, fontSize: 25, fontFamily: "Ethnocentric"),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.items.isEmpty) {
            return _buildEmptyCart(context);
          } else {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: cartProvider.items.map((item) {
                        return _buildCartItem(context, item);
                      }).toList(),
                    ),
                  ),
                ),
                _buildSummary(cartProvider,context),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/empty_cart.png',
            width: 200,
            height: 200,
          ),
          SizedBox(height: 16),
          Text(
            'Your cart is empty',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'LOOKS LIKE YOU HAVEN\'T ADDED ANYTHING TO YOUR CART YET.',
            style: TextStyle(
                color: Colors.white70, fontSize: 16, fontFamily: "Inter"),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'ORDER SOMETHING',
                  style: TextStyle(
                      fontFamily: "Inter", color: Colors.white, fontSize: 16),
                ),
                SizedBox(width: 8.0),
                Icon(Icons.arrow_forward, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, CartItem item) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Card(
      color: Colors.grey[850],
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset('assets/peach_milkshake.png', width: 80, height: 80),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Each: ₹${item.price}',
                    style: TextStyle(color: Colors.white70),
                  ),
                  Text(
                    'No. of sub-items: ${item.quantity}',
                    style: TextStyle(color: Colors.white70),
                  ),
                  Text(
                    'Subtotal: ₹${item.subtotal}',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.white),
                  onPressed: () => cartProvider.decrementQuantity(item),
                ),
                Text(
                  item.quantity.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.white),
                  onPressed: () => cartProvider.incrementQuantity(item),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.white),
                  onPressed: () => cartProvider.removeItem(item),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildSummary(CartProvider cartProvider,BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'NO. OF ITEMS:',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                cartProvider.totalItems.toString(),
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TOTAL:',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                '₹${cartProvider.totalPrice}',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            ),
            onPressed: () {
              Navigator.push(context , MaterialPageRoute(builder: (_)=>PaymentSuccesful()));
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Checkout',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(width: 8.0),
                Icon(Icons.arrow_forward, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}