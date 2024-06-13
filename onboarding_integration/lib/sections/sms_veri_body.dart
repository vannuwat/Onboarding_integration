import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_integration/sections/input_mobile.dart';

class SmsVerificationBody extends ConsumerWidget {
  final String phoneNo;

  SmsVerificationBody({required this.phoneNo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the refIdProvider state    
    final refId = ref.watch(refIdProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('smsTitle'),
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        // Space from title
        SizedBox(height: 16),
        // Otp messages
        Text(
          tr('otp'),
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 18, color: Color.fromRGBO(76, 76, 76, 1)),
        ),
        // Phone Number from input previous screen
        Text(
          '(+66) $phoneNo',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 17.5, color: Color.fromRGBO(0, 100, 255, 1)),
        ),
        // Space from title
        SizedBox(height: 32),
        // Code Reference        
        Text(
          'Reference: $refId',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 11.2, color: Color.fromRGBO(128, 128, 128, 1)),
        ),
        // Space from code reference
        SizedBox(height: 8),
      ],
    );
  }
}
