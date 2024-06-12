import 'package:flutter/material.dart';

class CustomButtonStyle extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool isBlack;

  const CustomButtonStyle({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isBlack,
  });

  @override
  Widget build(BuildContext context) {
    ButtonStyle blackStyle = ElevatedButton.styleFrom(
      fixedSize: Size(MediaQuery.of(context).size.width * 0.85, 50),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
    ButtonStyle greyStyle = ElevatedButton.styleFrom(
      fixedSize: Size(MediaQuery.of(context).size.width * 0.85, 50),
      backgroundColor: Colors.grey,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
    return(
      ElevatedButton(
        style: isBlack ? blackStyle : greyStyle,
        onPressed: onPressed,
        child: Text(text),
      )
    );
  }
}