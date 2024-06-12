import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_integration/custom_widgets/button_style.dart';
import 'package:onboarding_integration/custom_widgets/success_textStyle.dart';
import 'package:onboarding_integration/page/onboarding.dart';

class SuccessDisplay extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: (Column(children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Icon(
              Icons.done_outlined,
              color: Colors.white,
            )),
        SizedBox(height: 10),
        SuccessTextStyle(text: 'Success', size: 25),
        SizedBox(height: 10),
        SuccessTextStyle(text: 'Your account has been created', size: 18),
        SizedBox(height: MediaQuery.of(context).size.height * 0.4),
        CustomButtonStyle(
          text: "Done",
          onPressed: (){
             Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OnboardingGenerateRTA()),
          );
          }, 
          isBlack: true,
        ),
      ])),
    );
  }
}
