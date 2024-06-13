import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_integration/api/api.dart';
import 'package:onboarding_integration/sections/input_mobile.dart';
import 'package:onboarding_integration/sections/sms_veri_body.dart';
import 'package:pinput/pinput.dart';
import 'package:onboarding_integration/custom_widgets/button_style.dart';
import 'package:onboarding_integration/page/success_screen.dart';

final pinEditingControllerProvider = StateProvider.autoDispose<TextEditingController>((ref) => TextEditingController());
final pinInputCompleteProvider = StateProvider.autoDispose<bool>((ref) => false);
final errorMessageProvider = StateProvider.autoDispose<bool>((ref) => false);
final resendOtpProvider = StateProvider.autoDispose<bool>((ref) => false);
 
class PinInput extends ConsumerWidget {
  final ValueChanged<String>? onSubmit;
  final double fieldWidth;
  final double fieldHeight;
  final BoxDecoration? submittedFieldDecoration;
  final BoxDecoration? selectedFieldDecoration;
  final BoxDecoration? followingFieldDecoration;
  final String phoneNo; 

  const PinInput({
    Key? key,
    this.onSubmit,
    this.fieldWidth = 39,
    this.fieldHeight = 48,
    this.submittedFieldDecoration,
    this.selectedFieldDecoration,
    this.followingFieldDecoration,
    required this.phoneNo,    
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinEditingController = ref.watch(pinEditingControllerProvider);

    final defaultPinTheme = PinTheme(
      width: 39,
      height: 48,
      
      textStyle: const TextStyle(
        fontSize: 34.2,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color.fromRGBO(178, 178, 178, 1)),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color.fromRGBO(23, 171, 144, 1)),
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [
        Pinput(
          // Legnth of OTP Pin in digit
          length: 6,
          controller: pinEditingController,
          defaultPinTheme: defaultPinTheme, 
          focusedPinTheme: focusedPinTheme,
          // Length of between each box
          separatorBuilder: (index) => const SizedBox(width: 24),

          hapticFeedbackType: HapticFeedbackType.selectionClick,
          // Set stage to not complete if not input all 6 pin
          onChanged:(pin) {
           pin.length!=6 ?  ref.read(pinInputCompleteProvider.notifier).state = false: null;
          },
          // Set stage to complete if input all 6 pin
          onCompleted: (pin) {
            ref.read(pinInputCompleteProvider.notifier).state = true;  
          },          

        ),
        // Space from pinput
        SizedBox(height: 10),
        ref.watch(errorMessageProvider)
          ? Text("OTP is incorrect",            
              textAlign: TextAlign.left, 
              style: TextStyle(fontSize: 14, color: Colors.red))
          : SizedBox(),          
        SizedBox(height: 22),
        SizedBox(
          width: 355,
          height: 52,
          // Confirm button after input pin
          child: CustomButtonStyle(
            isBlack: ref.watch(pinInputCompleteProvider),
            text: "Confirm",
            onPressed: !ref.watch(pinInputCompleteProvider)? null : () async {
              final pin = pinEditingController.text;
              final refId = ref.read(refIdProvider);
              // Check if input OTP match OTP send to SMS                
              final isSuccess = await verifyOtp(refId, pin);              
              if (isSuccess.success!) {
                // Navigate to the next screen and send API to create account if OTP is correct
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SuccessScreen()),
                );
              } else {
                // Set stage to show an error message if OTP is incorrect
                ref.read(errorMessageProvider.notifier).state = true;              
              }         
            },
          ),
        ),
        SizedBox(height: 16),
        GestureDetector(
          onTap: () async {
          // Resend OTP    
          final String language = context.locale == Locale('en') ? 'EN' : 'TH';
          final otpResponse = await requestOtp('0$phoneNo', language);      
          ref.read(resendOtpProvider.notifier).state = true;           
          ref.read(refIdProvider.notifier).state = otpResponse.refId!;       
          },
          child: Text("Resend OTP",
            textAlign: TextAlign.left, 
            style: TextStyle(fontSize: 14, decoration: TextDecoration.underline ,color: Color.fromRGBO(0, 100, 255, 1)
            ),
          ),  
        ),
        SizedBox(height: 10),
        ref.watch(resendOtpProvider)
          ? Text("Resend OTP successful",            
              textAlign: TextAlign.left, 
              style: TextStyle(fontSize: 14, color: Color.fromARGB(234, 161, 202, 25)))
          : SizedBox(),   
      ],
    );
  }
}         
