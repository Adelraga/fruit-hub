import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market_app/Features/Auth/presentation/pages/login/view/Login-View.dart';
import 'package:fruit_market_app/Features/OnBoarding/presentation/view/widgets/Custom_dots_indicator.dart';
import 'package:fruit_market_app/Features/OnBoarding/presentation/view/widgets/custom-page-view.dart';
import 'package:fruit_market_app/core/utils/size-ONFIG.dart';
import 'package:fruit_market_app/core/widgets/Custom-Button.dart';
import 'package:get/get.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPageView(
          pageController: pageController,
        ),
        Positioned(
          bottom: SizeConfig.defaultSize! * 20,
          left: 0,
          right: 0,
          child: CustomDotsIndicator(
            dotsindex: pageController!.hasClients
                ? pageController!.page?.toInt() ?? 0
                : 0,
          ),
        ),
        Visibility(
          visible: pageController!.hasClients
              ? pageController?.page == 2
                  ? false
                  : true
              : true,
          child: Positioned(
            top: SizeConfig.defaultSize! * 5,
            right: 25,
            child: TextButton(
              onPressed: () {
                if (pageController!.page! < 2) {
                  pageController!.nextPage(
                      duration: Duration(microseconds: 500),
                      curve: Curves.easeIn);
                }
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: const Color(0xff898989),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: SizeConfig.defaultSize! * 10,
          right: SizeConfig.defaultSize! * 10,
          bottom: SizeConfig.defaultSize! * 5,
          child: CustomGeneralButton(
            text: pageController!.hasClients
                ? pageController?.page == 2
                    ? "Get Started"
                    : "Next"
                : "Next",
            onTap: () {
              if (pageController!.page! < 2) {
                pageController!.nextPage(
                    duration: Duration(microseconds: 500),
                    curve: Curves.easeIn);
              } else {
                Get.to(() => LoginView(),
                    transition: Transition.rightToLeft,
                    duration: Duration(milliseconds: 500),
                    );
              }
            },
          ),
        )
      ],
    );
  }
}
