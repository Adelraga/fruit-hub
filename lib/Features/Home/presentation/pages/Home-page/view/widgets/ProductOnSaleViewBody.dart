import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Home-page/view/widgets/Custom_list_view.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Home-page/view/widgets/product_grid_list.dart';

class ProductOnSaleViewBody extends StatelessWidget {
  ProductOnSaleViewBody({super.key});
  bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      "assets/images/box.png",
                    ),
                  ),
                  Text(
                    "No Product to On Sale",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
        : CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: ProductList(),
                ),
              )
            ],
          );
  }
}
