import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/languageTriggerButton.dart';
import 'package:shopping_app/widgets/profile_auth_button.dart';
import 'package:shopping_app/widgets/scroableWidgets/productsGridview.dart';
import 'package:shopping_app/widgets/scroableWidgets/productsPageView.dart';
import 'package:shopping_app/widgets/scroableWidgets/productslistview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr("AppBarTitle")),
        actions: const [LanguageTriggerButton(), ProfileAuthButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tr("our_products"),
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
                tr("hot_offers"),
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
