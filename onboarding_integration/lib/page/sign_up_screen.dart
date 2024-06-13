import 'package:onboarding_integration/sections/input_mobile.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_integration/sections/language_style.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          LanguageSelection(),
        ],
      ),
      body: InputMobile()
    ));
  }
}



