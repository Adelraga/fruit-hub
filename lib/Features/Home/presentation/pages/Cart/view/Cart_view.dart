import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Cart/view/widget/Cart_view_body.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Category/view/widget/Category_view_body.dart';
import 'package:fruit_market_app/core/providers/Theme_color.dart';
import 'package:fruit_market_app/core/services/utils.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(IconlyBold.delete,
                color: themeState.getDarkTheme ? Colors.white : Colors.black),
          ),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: themeState.getDarkTheme
            ? Theme.of(context).cardColor
            : Colors.white,
        title: Text(
          "Cart (3)",
          style: TextStyle(
              color: themeState.getDarkTheme ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: CartViewBody(),
    );
  }
}
