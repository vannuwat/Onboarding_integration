import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_integration/custom_widgets/button_style.dart';
import 'package:onboarding_integration/page/sms_verification_screen.dart';

class InputMobile extends StatefulWidget {
  @override
  State<InputMobile> createState() => _InputMobileState();
}

class _InputMobileState extends State<InputMobile> {
  late TextEditingController _controller;
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _isChecked = false;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isNumeric(String s) {
    return int.tryParse(s) != null && s.length == 9;
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
        padding: EdgeInsets.all(30),
        child: Column(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 50,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Sign up",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              SizedBox(
                height: 30,
              ),
              Text("Phone Number",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _controller,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: '+66|e.g. 91 234 5678',
                ),
              ),
            ])
          ]),
          SizedBox(height: 50),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Wrap(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.blue,
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          }),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(text: "I agree to Bangkok Bank's "),
                              TextSpan(
                                text: "terms and conditions",
                                style: TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    //terms and conditions link
                                  },
                              ),
                              TextSpan(
                                  text: ", and I agree to share the personal information which is necessary for registration with “BBL Wallet” regarding "),
                              TextSpan(
                                  text: "Privacy Policy.",
                                  style: TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      //Privacy link
                                    }),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 50),
                  CustomButtonStyle(
                      isBlack: _isChecked,
                      onPressed: !_isChecked ? null : () async {
                        if (!isNumeric(_controller.text) || !_isChecked) {
                          // error input 
                          await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: const Text('Warning'),
                                    content: Text(
                                        '${_controller.text}${" is not a phone numbers"}'),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            _controller.clear();
                                            setState(() {
                                              _isChecked = false;
                                            });
                                          },
                                          child: Text("OK"))
                                    ]);
                              });
                        }
                        else{
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SmsVerificationScreen(phoneNo: _controller.text)),
                          );
                        }
                      },
                      text: "Confirm")
                ]),
          ),
        ])));
  }
}
