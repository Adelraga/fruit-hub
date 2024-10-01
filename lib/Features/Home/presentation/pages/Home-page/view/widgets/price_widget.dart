import 'package:flutter/material.dart';
import 'package:fruit_market_app/core/services/utils.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
      {super.key, required this.mainPrice, required this.beforePrice});
  final String mainPrice;
  final String beforePrice; 
  @override
  Widget build(BuildContext context) {
    final bool getTheme = Utils(context).getTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mainPrice,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: getTheme ? Colors.black : Colors.green),
        ),
        Text(
          beforePrice,
          style: const TextStyle(
              fontSize: 18,
              textBaseline: TextBaseline.alphabetic,
              decoration: TextDecoration.lineThrough),
        ),
      ],
    );
  }
}
