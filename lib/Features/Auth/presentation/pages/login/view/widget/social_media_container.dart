import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SocialMediaContainer extends StatelessWidget {
  const SocialMediaContainer({
    super.key,
    required this.icon,
    required this.text,
    this.onTap, // Add this parameter
  });

  final IconData icon;
  final String text;
  final VoidCallback? onTap; // Allow the onTap callback

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // Use GestureDetector to handle onTap
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 246, 246, 246),
          border: Border.all(
            color: Color.fromARGB(255, 199, 199, 199),
            width: 1,
          ),
        ),
        child: ListTile(
          leading: Icon(
            icon,
          ),
          title: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
