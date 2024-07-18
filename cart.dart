import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          "CART",
          style: TextStyle(
              color: Colors.red, fontSize: 25, fontFamily: "Ethnocentric"),
        ),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartProvider.items.length,
                  itemBuilder: (context, index) {
                    final item = cartProvider.items[index];
                    return _buildCartItem(context, item);
                  },
                ),
              ),
              _buildSummary(cartProvider),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, CartItem item) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    SingleChildScrollView;
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
                    'EACH: ₹${item.price}',
                    style:
                        TextStyle(color: Colors.white70, fontFamily: "Inter"),
                  ),
                  Text(
                    'NO. OF SUB ITEMS: ${item.quantity}',
                    style:
                        TextStyle(color: Colors.white70, fontFamily: "Inter"),
                  ),
                  Text(
                    'SUBTOTAL: ₹${item.subtotal}',
                    style:
                        TextStyle(color: Colors.white70, fontFamily: "Inter"),
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

  Widget _buildSummary(CartProvider cartProvider) {
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
              // Handle checkout
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
