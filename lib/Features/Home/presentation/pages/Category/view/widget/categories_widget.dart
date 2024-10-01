import 'package:flutter/material.dart';
import 'package:fruit_market_app/Features/Auth/presentation/pages/login/view/Login-View.dart';
import 'package:fruit_market_app/core/providers/Theme_color.dart';
import 'package:fruit_market_app/core/widgets/text_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {Key? key,
      required this.catText,
      required this.imgPath,
      required this.passedColor})
      : super(key: key);
  final String catText, imgPath;
  final Color passedColor;
  @override
  Widget build(BuildContext context) {
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
      child: Container(
        // height: _screenWidth * 0.6,
        decoration: BoxDecoration(
          color: passedColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: passedColor.withOpacity(0.7),
            width: 2,
          ),
        ),
        child: Column(children: [
          // Container for the image
          Container(
            height: _screenWidth * 0.3,
            width: _screenWidth * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    imgPath,
                  ),
                  fit: BoxFit.fill),
            ),
          ),
          // Category name
          TextWidget(
            text: catText,
            color: color,
            textSize: 20,
            isTitle: true,
          ),
        ]),
      ),
    );
  }
}
