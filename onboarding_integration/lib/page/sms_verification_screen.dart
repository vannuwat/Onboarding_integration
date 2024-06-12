import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_integration/sections/sms_veri_body.dart';
import 'package:onboarding_integration/sections/sms_veri_pin_input.dart';

class SmsVerificationScreen extends ConsumerWidget {
  final String phoneNo;
  
  SmsVerificationScreen({required this.phoneNo});  

  @override
  Widget build(BuildContext context, WidgetRef ref) {    
    return Scaffold(
      // appBar: AppBar(
      //   actions: <Widget>[
      //     LanguageSelection(),
      //   ],
      // ),
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(   
          mainAxisAlignment: MainAxisAlignment.start,          
          children: [         
            // Space from appbar            
            SizedBox(height: 56),
            // Title of this screen
            Align(
              alignment: Alignment.centerLeft,
              child: SmsVerificationBody(phoneNo: phoneNo),
            ),            
            // Input Pin widget
            PinInput(),    
          ],
        ),
      ),
    );
  }
}