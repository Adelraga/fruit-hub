import 'package:flutter/material.dart';
import 'package:fruit_market_app/Features/Splash/presentation/view/widgets/splash-view-body.dart';

import '../../../../core/consts/constant.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: KPrimaryColor,
      body: SplashViewBody(),
      
    );
  }
}