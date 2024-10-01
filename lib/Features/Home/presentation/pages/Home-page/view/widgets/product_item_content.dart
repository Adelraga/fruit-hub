import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fruit_market_app/core/services/utils.dart';
import 'package:fruit_market_app/core/widgets/text_widget.dart';

class ProductItemContent extends StatelessWidget {
  const ProductItemContent({super.key, required this.catText,});
final String catText;
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final bool getTheme = Utils(context).getTheme;
    return Column(
      children: [
                      Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: catText,
                    color: color,
                    textSize: 19,
                    isTitle: true,
                  ),
                  GestureDetector(
                    child: Icon(
                      IconlyLight.heart,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: "\$0.99",
                    color: getTheme ? Colors.black : Colors.green,
                    textSize: 19,
                    isTitle: true,
                  ),
                  TextWidget(
                    text: "1 KG",
                    color: color,
                    textSize: 19,
                    isTitle: true,
                  ),
                ],
              ),
      ],
    );
  }
}