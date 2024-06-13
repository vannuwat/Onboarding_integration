import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_integration/api/api.dart';
import 'package:onboarding_integration/custom_widgets/button_style.dart';
import 'package:onboarding_integration/page/sms_verification_screen.dart';

final refIdProvider = StateProvider<String>((ref) => "");
final textEditingProvider = StateProvider.autoDispose<bool>((ref) => false);
final checkProvider = StateProvider.autoDispose<bool>((ref) => false);


class InputMobile extends ConsumerStatefulWidget  {
  @override
  _InputMobileState createState() => _InputMobileState();
}

class _InputMobileState extends ConsumerState<InputMobile> {
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
              Text(tr("signUp"),
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              SizedBox(
                height: 30,
              ),
              Text(tr("phoneNo"),
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
                              TextSpan(text: tr("agreeMsg1")),
                              TextSpan(
                                text: tr('term'),
                                style: TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    //terms and conditions link
                                  },
                              ),
                              TextSpan(
                                  text: tr('agreeMsg2')),
                              TextSpan(
                                  text: tr('privacy'),
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
                                        '${_controller.text}${tr("notPhoneNo")}'),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            _controller.clear();
                                            setState(() {
                                              _isChecked = false;
                                            });
                                          },
                                          child: Text(tr('ok')))
                                    ]);
                              });
                        }
                        else{
                          final String language = context.locale == Locale('en') ? 'EN' : 'TH';  
                          final otpResponse = await requestOtp('0${_controller.text}', language);
                          ref.read(refIdProvider.notifier).state = otpResponse.refId!;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SmsVerificationScreen(phoneNo: _controller.text)),                            
                          );
                        }
                      },
                      text: tr('confirm'))
                ]),
          ),
        ])));
  }
}

