import 'package:flutter/material.dart';
import 'package:fruit_market_app/Features/OnBoarding/presentation/view/widgets/page_view_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, this.pageController});
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller:pageController ,
      children: [
        PageViewItem(
          imageurl: 'assets/images/onboarding1.png',
          title: "E Shopping",
          desc: 'Explore  top organic fruits & grab them',
        ),
        PageViewItem(
          imageurl: 'assets/images/onboarding2.png',
          title: "Delivery on the way",
          desc: 'Get your order by speed delivery',
        ),
        PageViewItem(
          imageurl: 'assets/images/onboarding3.png',
          title: "Delivery Arrived",
          desc: 'Order is arrived at your Place',
        ),
      ],
    );
  }
}
