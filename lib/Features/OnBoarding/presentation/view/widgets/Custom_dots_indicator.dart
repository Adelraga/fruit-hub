import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market_app/core/consts/constant.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({super.key, required this.dotsindex});
  final int? dotsindex;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: dotsindex ??0,
      decorator: const DotsDecorator(
        activeColor: KPrimaryColor,
        color: Colors.transparent,
        shape: CircleBorder(
          side: BorderSide(color: KPrimaryColor),
        ),
      ),
    );
  }
}
