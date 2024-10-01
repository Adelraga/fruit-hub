import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Cart/view/widget/CartListItem.dart';
import 'package:fruit_market_app/core/services/utils.dart';
import 'package:fruit_market_app/core/widgets/text_widget.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Order Now"),
                ),
              ),
              Spacer(),
              Row(
                children: [
                  TextWidget(
                    text: "total Price: ",
                    textSize: 15,
                    color: color,
                  ),
                  TextWidget(
                    text: "\$ 1.5",
                    textSize: 15,
                    color: color,
                    isTitle: true,
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CartListItem(),
                );
              }),
        ),
      ],
    );
  }
}
