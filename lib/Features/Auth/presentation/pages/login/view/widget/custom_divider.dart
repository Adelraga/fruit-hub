import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: Colors.grey,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ),
                  Text("أو",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: Colors.grey,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ),
                ],
              );
  }
}