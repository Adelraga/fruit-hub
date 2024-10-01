import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Cart/view/Cart_view.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Category/view/Category_view.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Home-page/view/Home_page.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/User/view/User_view.dart';
import 'package:fruit_market_app/core/providers/Theme_color.dart';
import 'package:fruit_market_app/core/utils/size-ONFIG.dart';
import 'package:provider/provider.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  final List<Map<String, dynamic>> _pages = [
    {"page": HomeView(), "title": "Home page"},
    {"page": CategoryView(), "title": "Category page"},
    {"page": CartView(), "title": "Cart page"},
    {"page": UserView(), "title": "User page"},
  ];
  int selectedIndex = 0;

  void selectedPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      
      appBar: selectedIndex == 0 || selectedIndex == 2
          ? null
          : AppBar(
              elevation: 0,
              title: Text(
                _pages[selectedIndex]["title"],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: themeState.getDarkTheme ? Colors.white : Colors.black,
                ),
              ),
              automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: themeState.getDarkTheme
                  ? Theme.of(context).cardColor
                  : Colors.white,
            ),
            
          
      body:
       _pages[selectedIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: themeState.getDarkTheme
            ? Theme.of(context).cardColor
            : Colors.white,
        unselectedItemColor:
            themeState.getDarkTheme ? Colors.white : Colors.black,
        selectedItemColor:
            themeState.getDarkTheme ? Colors.lightBlue : Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: selectedPage,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 1
                ? IconlyBold.category
                : IconlyLight.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon:
                Icon(selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
            label: "User",
          ),
        ],
        
      ),
      
    );
  }
}
