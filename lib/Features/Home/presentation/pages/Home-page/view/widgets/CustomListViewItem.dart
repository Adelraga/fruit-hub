import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Home-page/view/widgets/price_widget.dart';
import 'package:fruit_market_app/core/services/utils.dart';
import 'package:fruit_market_app/core/utils/size-ONFIG.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});
  @override
  Widget build(BuildContext context) {
    final bool getTheme = Utils(context).getTheme;
    final Color color = Utils(context).color;
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 2.5,
        child: Container(
          decoration: BoxDecoration(
            color: getTheme ? Colors.grey.withOpacity(0.4) : Colors.grey[200],
            border: Border.all(
              color: getTheme
                  ? Colors.grey.withOpacity(0.4)
                  : Colors.grey[200]!.withOpacity(0.7),
              width: 2,
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 0, top: 5, right: 5, bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/images/5a1c5d589d8dc0.0873634115118083446454.png",
                        height: SizeConfig.defaultSize! * 12,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "1KG",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              child: Icon(
                                IconlyLight.bag,
                              ),
                            ),
                            GestureDetector(
                              child: Icon(
                                IconlyLight.heart,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PriceWidget(
                        mainPrice: "\$1.59",
                        beforePrice: "\$1.99",
                      ),
                      Text(
                        "orange",
                        style: TextStyle(
                          fontSize: 20,
                          color: color,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
