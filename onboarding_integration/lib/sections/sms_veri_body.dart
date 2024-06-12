import 'package:flutter/material.dart';

class SmsVerificationBody extends StatelessWidget{
  final String phoneNo;  
  SmsVerificationBody({required this.phoneNo});    

  @override
  Widget build(BuildContext context) {            
    return Column(      
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [  
        Text("SMS Verification",
          textAlign: TextAlign.left, 
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black)),
          // Space from title
          SizedBox(height: 16),
          // Otp messages
          Text("OTP has been sent to your phone",
            textAlign: TextAlign.left, 
            style: TextStyle(fontSize: 18, color: Color.fromRGBO(76, 76, 76, 1))),              
          // Phone Number from input previous screen
          Text('(+66) $phoneNo',
            textAlign: TextAlign.left, 
            style: TextStyle(fontSize: 17.5, color: Color.fromRGBO(0, 100, 255, 1))),
          // Space from title
          SizedBox(height: 32),  
          // Code Reference     
          Text("Reference",
            textAlign: TextAlign.left, 
            style: TextStyle(fontSize: 11.2, color: Color.fromRGBO(128, 128, 128, 1))),
          // Space from code reference
          SizedBox(height: 8), 
        ],
    );  
  }       
} 