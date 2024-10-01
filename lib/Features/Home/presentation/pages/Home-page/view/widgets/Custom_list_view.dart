import 'package:flutter/material.dart';
import 'package:fruit_market_app/Features/Home/presentation/pages/Home-page/view/widgets/CustomListViewItem.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: CustomListViewItem(),
              );
            }),
      ),
    );
  }
}
