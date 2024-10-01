import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  const FormTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        
        fontSize: 16,
        color: Color(0xff0c0b0b),
        fontWeight: FontWeight.w600,
        height: 1.5625,
      ),
      
      
      );
  }
}