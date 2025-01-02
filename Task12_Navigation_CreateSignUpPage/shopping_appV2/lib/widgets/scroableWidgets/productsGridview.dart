import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/productItem.dart';

class productsGridView extends StatelessWidget {
  const productsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          0.5, // Fixed height for the grid.
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of products in each row.
        ),
        itemCount: 6, // Total number of items in the grid.
        itemBuilder: (BuildContext context, int index) {
          return ProductItem(
            index:
                0, // Fixed index to determine calling from grid view not the list view.
          );
        },
      ),
    );
  }
}
