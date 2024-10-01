import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/User/view/widget/UserHeaderTitle.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/User/view/widget/dialog_box.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/User/view/widget/userListItem.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/User/view/widget/userlist.dart';
import 'package:fruit_market_app/core/providers/Theme_color.dart';
import 'package:fruit_market_app/core/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class UserViewBody extends StatefulWidget {
  const UserViewBody({super.key});

  @override
  State<UserViewBody> createState() => _UserViewBodyState();
}

class _UserViewBodyState extends State<UserViewBody> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: UserHeaderTitle(),
          ),
          userListItem(),
        ],
      ),
    );
  }
}
