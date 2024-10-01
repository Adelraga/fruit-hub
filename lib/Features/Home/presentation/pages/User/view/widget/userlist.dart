import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/User/view/widget/Dialog_box_signout.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/User/view/widget/UserHeaderTitle.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/User/view/widget/dialog_box.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/User/view/widget/userListItem.dart';
import 'package:fruit_market_app/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/providers/Theme_color.dart';

class userListItem extends StatefulWidget {
  const userListItem({super.key});

  @override
  State<userListItem> createState() => _userListItemState();
}

class _userListItemState extends State<userListItem> {
  final TextEditingController controller = TextEditingController();
  Future<void> createNewTask() async {
    await showDialog(
        context: context,
        builder: (context) {
          return DialogBoxItem(
              onChanged: () => Navigator.pop(context), controller: controller);
        });
    setState(() {
      // You can update the widget's state or perform any other actions here.
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Divider(
          thickness: 2,
          color: Colors.grey[300],
          indent: 20,
          endIndent: 20,
        ),
        UserItem(
          title: "Address",
          subtitle: controller.text,
          icon: IconlyLight.profile,
          onPressed: createNewTask,
        ),
        const UserItem(
          title: "Orders",
          subtitle: "",
          icon: IconlyLight.bag,
        ),
        const UserItem(
          title: "Wishlist",
          subtitle: "",
          icon: IconlyLight.heart,
        ),
        const UserItem(
          title: "Viewed",
          subtitle: "",
          icon: IconlyLight.show,
        ),
        const UserItem(
          title: "Forget Password",
          subtitle: "",
          icon: IconlyLight.unlock,
        ),
        SwitchListTile(
          secondary: Icon(themeState.getDarkTheme
              ? Icons.dark_mode_outlined
              : Icons.light_mode_outlined),
          title: const Text("theme"),
          onChanged: (bool value) {
            setState(() {
              themeState.setDarkTheme = value;
            });
          },
          value: themeState.getDarkTheme,
        ),

        // for change the langauge
        UserItem(
          title: S.of(context).Title,
          subtitle: "",
          icon: IconlyLight.setting,
        ),

        UserItem(
          title: "Logout",
          subtitle: "",
          icon: IconlyLight.logout,
          onPressed: () async {
            await showDialog(
                context: context,
                builder: (context) {
                  return DialogBoxItemSignOut(
                      // onCancel: () {
                      //   Navigator.pop(context);
                      // },
                      );
                });
            setState(() {
              // You can update the widget's state or perform any other actions here.
            });
          },
        ),
      ],
    );
  }
}
