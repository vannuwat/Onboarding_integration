import 'package:flutter/material.dart';

class SuccessTextStyle extends StatelessWidget {
  final String text;
  final double size;
  const SuccessTextStyle({
    super.key,
    required this.text,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      fontSize: size,
      color: Colors.black,
      decoration: TextDecoration.none,
    ),);
  }
}