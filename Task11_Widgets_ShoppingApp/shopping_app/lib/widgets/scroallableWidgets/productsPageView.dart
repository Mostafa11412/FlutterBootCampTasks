import 'package:flutter/material.dart';

class ProductsPageview extends StatelessWidget {
  const ProductsPageview({super.key});

  @override
  Widget build(BuildContext context) {
    // List of dummy product images for the page view.
    List<String> images = [
      "assets/product1.jpg",
      "assets/product2.jpg",
      "assets/product3.jpg",
      "assets/product4.jpg"
    ];
    return SizedBox(
      width: double.infinity, // Fills the available width.
      height: MediaQuery.of(context).size.height *
          0.23, // Fixed height for the page view.
      child: PageView(
        children: [
          Image.asset(
            images[0],
            fit: BoxFit.fill, // Ensures the image fills the available space.
          ),
          Image.asset(images[1], fit: BoxFit.fill),
          Image.asset(images[2], fit: BoxFit.fill),
          Image.asset(images[3], fit: BoxFit.fill),
        ],
      ),
    );
  }
}
