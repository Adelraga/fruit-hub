import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fruit_market_app/core/widgets/text_widget.dart';

class CustomOnSaleTextWidget extends StatelessWidget {
  const CustomOnSaleTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Row(
        children: [
          TextWidget(
            text: 'On Sale'.toUpperCase(),
            textSize: 25,
            color: Colors.red,
            isTitle: true,
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            IconlyLight.discount,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
