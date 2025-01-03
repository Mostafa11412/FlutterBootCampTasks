// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  // Index of the product, used to access product-specific data.
  int index;

  ProductItem({super.key, required this.index});

  List<String> images = [
    "assets/sampleProduct.jpg",
    "assets/sampleProduct2.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // Styling for the container, including rounded corners and background color.
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey,
      ),
      margin: const EdgeInsets.all(8), // Outer margin of the product.
      padding: const EdgeInsets.all(8), // Inner padding inside the container.
      child: Column(
        children: [
          // Expanded widget to adjust the space taken by the image.
          Expanded(
            flex: 4, // Allocates 4x of the space for image.
            child: Image.asset(
              images[
                  index], // Dynamically selects the image based on the index.
              fit: BoxFit.fill,
              width: 150,
            ),
          ),
          // Expanded widget to adjust the space taken by the text.
          Expanded(
            child: Center(
              child: Text(
                tr("ProductTestName"),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 15), // Custom text style.
              ),
            ),
          ),
          // Conditional rendering upon index paramete for the add-to-cart button.
          index == 0
              ? Expanded(
                  child: IconButton(
                      onPressed: () {
                        // Displays a snackbar when the button is pressed.
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            tr("itemAddedtoCart"),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.white),
                          ),
                        ));
                      },
                      icon: const Icon(Icons.add_circle)))
              : const SizedBox() // Empty widget for non-zero index.
        ],
      ),
    );
  }
}
