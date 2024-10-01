import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Category/view/widget/Category_view_body.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CategoriesScreen(),
    );
  }
}
