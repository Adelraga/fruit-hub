import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Category/view/widget/Category_view_body.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/User/view/widget/user_view_body.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserViewBody(),
    );
  }
}
