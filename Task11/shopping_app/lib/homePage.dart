import 'package:flutter/material.dart';
import 'package:shopping_app/productsGridview.dart';
import 'package:shopping_app/productsPageView.dart';
import 'package:shopping_app/productslistview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sprints Shopping App'),
        centerTitle: true,
        titleTextStyle: Theme.of(context)
            .textTheme
            .titleLarge, // using custom style initialized in main.
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Outer padding of the body.
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Aligns content to the start.
            children: [
              Text(
                "Our Products",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 20), // using custom style initialized in main.
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.01, // Spacing between sections using media query.
              ),
              const ProductsPageview(), // PageView displaying product images.
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const productsGridView(), // Grid view of products.
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                "Hot Offers",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 20), // using custom style initialized in main.
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const ProductsListView(), // Horizontal list view of products.
            ],
          ),
        ),
      ),
    );
  }
}
