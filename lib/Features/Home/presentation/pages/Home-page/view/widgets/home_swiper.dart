import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market_app/core/consts/constant.dart';

class HomeSwiper extends StatelessWidget {
  const HomeSwiper({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
      ),
      child: SizedBox(
        height: size.height * 0.33,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              offerImages[index],
              fit: BoxFit.fill,
            );
          },
          itemCount: offerImages.length,
          pagination: const SwiperPagination(),
          indicatorLayout: PageIndicatorLayout.SCALE,
          duration: Duration.millisecondsPerSecond,
          transformer: ScaleAndFadeTransformer(),
          curve: Curves.ease,
          autoplay: true,
        ),
      ),
    );
  }
}
