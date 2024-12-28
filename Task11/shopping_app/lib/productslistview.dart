import 'package:flutter/material.dart';
import 'package:shopping_app/productItem.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.23, // Fixed height for the list.
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Horizontal scrolling.
        itemCount: 5, // Total number of items in the list.
        itemBuilder: (BuildContext context, int index) {
          return  ProductItem(index: 1,); // Fixed index to determine calling from list view not the grid view.
        },
      ),
    );
  }
}