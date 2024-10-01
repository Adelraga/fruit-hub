import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fruit_market_app/Features/Auth/presentation/pages/login/view/Login-View.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Home-page/view/widgets/product_item_content.dart';
import 'package:fruit_market_app/core/providers/Theme_color.dart';
import 'package:fruit_market_app/core/services/utils.dart';
import 'package:fruit_market_app/core/widgets/text_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {Key? key,
      required this.catText,
      required this.imgPath,
      required this.passedColor})
      : super(key: key);
  final String catText, imgPath;
  final Color? passedColor;
  @override
  Widget build(BuildContext context) {
    final bool getTheme = Utils(context).getTheme;
    // Size size = MediaQuery.of(context).size;
    final themeState = Provider.of<DarkThemeProvider>(context);
    double _screenWidth = MediaQuery.of(context).size.width;
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return InkWell(
      onTap: () {
        Get.to(
          () => LoginView(),
          transition: Transition.rightToLeft,
          duration: Duration(milliseconds: 500),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
        child: Container(
          height: _screenWidth * 0.2,
          width: _screenWidth * 0.2,
          decoration: BoxDecoration(
            color: passedColor?.withOpacity(0.4),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: passedColor!.withOpacity(0.7),
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(children: [
              Container(
                width: _screenWidth * 0.3, // Set an appropriate width
                height: _screenWidth * 0.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        imgPath,
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              // Category name
              ProductItemContent(
                catText: catText,
              ),

              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Add To Cart",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
