import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fruit_market_app/core/services/utils.dart';
import 'package:fruit_market_app/core/utils/size-ONFIG.dart';
import 'package:fruit_market_app/core/widgets/text_widget.dart';
import 'package:get/get.dart';

class CartListItem extends StatefulWidget {
  CartListItem({super.key});

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  int quantitiy = 0;
  double price = 0.29;

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return GestureDetector(
      onTap: () {}, // TODO: Add functionality to remove item from cart
      child: Row(children: [
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 252, 239),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Container(
                child: Image.asset(
                  "assets/images/5a1c5d589d8dc0.0873634115118083446454.png",
                  height: SizeConfig.defaultSize! * 11,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    text: "Orange",
                    textSize: 20,
                    isTitle: true,
                  ),
                  SizedBox(height: SizeConfig.defaultSize! * 0.8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CartQuantitiy(
                          backgroundColor: Colors.red,
                          onPressed: () {
                            setState(() {
                              quantitiy -= 1;
                              price -= 1;
                            });
                          },
                          icon: CupertinoIcons.minus,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(quantitiy.toString())),
                        CartQuantitiy(
                          backgroundColor: Colors.green,
                          onPressed: () {
                            setState(() {
                              quantitiy += 1;
                              price += 1;
                            });
                          },
                          icon: CupertinoIcons.plus,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                width: SizeConfig.defaultSize! * 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        IconlyLight.buy,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        IconlyLight.heart,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: TextWidget(
                        text: "\$$price",
                        textSize: 18,
                        color: color,
                        maxLines: 1,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}

class CartQuantitiy extends StatelessWidget {
  const CartQuantitiy({
    super.key,
    required this.backgroundColor,
    this.onPressed,
    required this.icon,
  });
  final Color backgroundColor;
  final Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Container(
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(12)),
            width: 35,
            height: 35,
            child: Padding(
              padding: const EdgeInsets.only(),
              child: IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    icon,
                    color: Colors.white,
                  )),
            )),
      ),
    );
  }
}
