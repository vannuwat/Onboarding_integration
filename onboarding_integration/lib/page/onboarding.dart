import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher_string.dart';
import 'package:uuid/uuid.dart';

class OnboardingGenerateRTA extends StatefulWidget {
  const OnboardingGenerateRTA({super.key});

  @override
  State<OnboardingGenerateRTA> createState() => _OnboardingGenerateRTAState();
}

class _OnboardingGenerateRTAState extends State<OnboardingGenerateRTA> {

  // String token = "";
  String bankAppUrl = "";

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    void postData(String id) async {
      try{
      final now = DateTime.now().toIso8601String();

      final response = await http.post(
        Uri.parse(
            'http://10.136.110.36:9091/api/mbanking-service/AuthorizationService/api/v1/authorization/authorize-requests'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
        {
          "partnerInfo": {
            "partnerNameTH": "BeMerchantNextGen",
            "partnerNameEN": "BeMerchantNextGen"
          },
          "rtaInfo": {
            "identifier": id,
            "requestDateTime": now,
            "transType": "APP2APP"
          },
          "callBackInfo": {
            "osPlatform": "IOS",
            "partnerAppUrl": "bemerchantnextgenn://"
          },
          "channelHeader": {
            "correlationId": Uuid().v4(),
            "customerId": "0000202130118815",
            "requestDateTime": now,
            "language": "TH-th"
          }
        },
      ));

      setState(() {
        final de = jsonDecode(response.body);
        bankAppUrl = de["bankAppUrl"];
        bankAppUrl = bankAppUrl.replaceAll("{Token}", de["token"]);
      });
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    catch(e){
      print(e);
    }
    }

    return Center(
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          InkWell(
            child: Text(bankAppUrl),
            onTap: () => launchUrlString(bankAppUrl)
          ),
          ElevatedButton(
              onPressed: () {
                postData(controller.text);
              },
              child: const Text("Get RTA")),
        ],
      ),
    );
  }
}
