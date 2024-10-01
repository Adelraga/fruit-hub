import 'package:flutter/material.dart';
import 'package:fruit_market_app/Features/OnBoarding/presentation/view/widgets/onBoarding-view-body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:OnBoardingViewBody() ,
    );
  }
}