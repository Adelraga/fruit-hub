import 'package:flutter/material.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Home-page/view/widgets/Product_grid_item.dart';
import 'package:fruit_market_app/core/consts/constant.dart';
import 'package:fruit_market_app/core/services/utils.dart';
import 'package:fruit_market_app/core/widgets/text_widget.dart';

class ProductList extends StatelessWidget {
  ProductList({Key? key, this.physics}) : super(key: key);
  final  ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    final bool getTheme = Utils(context).getTheme;
    final utils = Utils(context);
    Color color = utils.color;
    return Container(
       height:MediaQuery.of(context).size.height,
       width: double.infinity,
      child: GridView.count(
        
        physics: physics,
        crossAxisCount: 2,
        childAspectRatio: 240 / 250,
        crossAxisSpacing: 2, // Vertical spacing
        mainAxisSpacing: 2, // Horizontal spacing
        children: List.generate(6, (index) {
          return ProductItem(
            catText: catInfo[index]['catText'],
            imgPath: catInfo[index]['imgPath'],
            passedColor: getTheme ? Colors.grey : Colors.grey[200],
          );
        }),
      ),
    );
  }
}
