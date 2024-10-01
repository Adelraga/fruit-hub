import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Home-page/view/widgets/ProductOnSaleViewBody.dart';

class ProductOnSaleView extends StatelessWidget {
  const ProductOnSaleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product On Sale'),
      ),
      body: ProductOnSaleViewBody(
       
      ),
    );
  }
}
