import 'package:flutter/material.dart';
import 'package:fruit_market_app/core/consts/constant.dart';
import 'package:fruit_market_app/core/services/utils.dart';
import 'package:fruit_market_app/core/widgets/text_widget.dart';

import 'categories_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 240 / 250,
        crossAxisSpacing: 10, // Vertical spacing
        mainAxisSpacing: 10, // Horizontal spacing
        children: List.generate(6, (index) {
          return CategoriesWidget(
            catText: catInfo[index]['catText'],
            imgPath: catInfo[index]['imgPath'],
            passedColor: gridColors[index],
          );
        }),
      ),
    ));
  }
}
