import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mym_bazar/cartProvider.dart';
import 'package:mym_bazar/payment.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(0.8),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.black.withOpacity(0.4),
                          foregroundColor: Colors.white,
                        ),
                        icon: Icon(Icons.arrow_back_ios_new, size: 40),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'asset/empty.webp',
                          height: 120,
                          width: 120,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          cart.clearCart();
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.black.withOpacity(0.4),
                          foregroundColor: Colors.white,
                        ),
                        icon: Icon(Icons.delete, size: 40),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Cart',
                  style: GoogleFonts.bungee(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.separated(
                itemCount: cart.cartItem.length,
                itemBuilder: (context, index) {
                  var item = cart.cartItem[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: Colors.teal.withOpacity(0.6)),
                    ),
                    child: ListTile(
                      leading: Image.asset(item['img']!),
                      title: Text(item['name']!),
                      subtitle: Text(item['price']! + item['amount']!),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            cart.removeCart(item);
                          });
                        },
                        icon: Icon(Icons.remove, size: 30),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(0.8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Total',
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${cart.total.toString()}৳',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymetType()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    "Pay Now",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
