import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fruit_market_app/Features/Auth/presentation/pages/login/view/Login-View.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Category/view/widget/Category_view_body.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Home-page/view/ProductOnSaleView.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Home-page/view/widgets/Custom_list_view.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Home-page/view/widgets/custom_onsale_text_widget.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Home-page/view/widgets/home_swiper.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Home-page/view/widgets/product_grid_list.dart';
import 'package:fruit_market_app/core/consts/constant.dart';
import 'package:fruit_market_app/core/providers/Theme_color.dart';
import 'package:fruit_market_app/core/services/utils.dart';
import 'package:fruit_market_app/core/utils/size-ONFIG.dart';
import 'package:fruit_market_app/core/widgets/btm_bar.dart';
import 'package:fruit_market_app/core/widgets/text_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              HomeSwiper(size: size),
              SizedBox(height: SizeConfig.defaultSize! * 0.8),
              TextButton(
                  onPressed: () {
                    Get.to(
                      () => ProductOnSaleView(),
                      transition: Transition.rightToLeft,
                      duration: Duration(milliseconds: 500),
                    );
                  },
                  child: Text(
                    "View All ",
                    style: TextStyle(fontSize: 20),
                  )),
              SizedBox(height: SizeConfig.defaultSize! * 0.8),
              Row(
                children: [
                  CustomOnSaleTextWidget(),
                  CustomListView(),
                ],
              ),
              SizedBox(height: SizeConfig.defaultSize! * 0.8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextWidget(
                      text: "OurProducts",
                      textSize: 22,
                      isTitle: true,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "View All ",
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              ),
              SizedBox(height: SizeConfig.defaultSize! * 0.8),
              ProductList(
                physics: NeverScrollableScrollPhysics(),
              ),
              Visibility(
                visible: Provider.of<InternetConnectionStatus>(context) ==
                    InternetConnectionStatus.disconnected,
                child: Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      "No Internet",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
