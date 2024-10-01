import 'package:flutter/material.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Cart/view/Cart_view.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Category/view/Category_view.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Home-page/view/Home_page.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/User/view/User_view.dart';

const KPrimaryColor = Color(0xFF69A03A);

  List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];

  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/fruits.png',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/veg.png',
      'catText': 'Vegetables',
    },
    {
      'imgPath': 'assets/images/Spinach.png',
      'catText': 'Herbs',
    },
    {
      'imgPath': 'assets/images/nuts.png',
      'catText': 'Nuts',
    },
    {
      'imgPath': 'assets/images/spices.png',
      'catText': 'Spices',
    },
    {
      'imgPath': 'assets/images/grains.png',
      'catText': 'Grains',
    },
  ];


List<String> offerImages = [
  'assets/images/Offer1.jpg',
  'assets/images/Offer2.jpg',
  'assets/images/Offer3.jpg',
  'assets/images/Offer4.jpg',
];