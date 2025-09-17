import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mym_bazar/cartPage.dart';
import 'package:mym_bazar/cartProvider.dart';
import 'package:mym_bazar/data.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  final String title;
  final String image;
  final List<Map<String, String>> items;
  const CategoryPage({
    super.key,
    required this.title,
    required this.image,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(0.8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
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
                      Image.asset(image, height: 120, width: 120),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Cart()),
                          );
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.black.withOpacity(0.4),
                          foregroundColor: Colors.white,
                        ),
                        icon: Icon(Icons.shopping_cart, size: 40),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    title,
                    style: GoogleFonts.bungee(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Items',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.teal.withOpacity(0.6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              color: Colors.teal.withOpacity(0.6),
                            ),
                          ),
                          child: Container(
                            child: Row(
                              children: [
                                Image.asset(
                                  items[index]['img']!,
                                  height: 100,
                                  width: 100,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        items[index]['name']!,
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24,
                                        ),
                                      ),
                                      Text(
                                        items[index]['price']!,
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        items[index]['amount']!,
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 10),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Provider.of<CartProvider>(
                                        context,
                                        listen: false,
                                      ).addCart(items[index]);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.teal.withOpacity(
                                        0.6,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      'Add to Cart',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
