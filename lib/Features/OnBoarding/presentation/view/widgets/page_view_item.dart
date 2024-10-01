import 'package:flutter/material.dart';
import 'package:fruit_market_app/core/utils/size-ONFIG.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.imageurl,
      required this.title,
      required this.desc});
  final String imageurl;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.defaultSize! * 12),
        SizedBox(
          height: SizeConfig.defaultSize! * 20,
          child: Image.asset(imageurl),
        ),
        SizedBox(height: SizeConfig.defaultSize! * 5),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: const Color(0xff2f2e41),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: SizeConfig.defaultSize! * 2),
        Text(
          desc,
          style: TextStyle(
            fontSize: 15,
            color: const Color(0xff78787c),
          ),
        ),
        
      ],
    );
  }
}
