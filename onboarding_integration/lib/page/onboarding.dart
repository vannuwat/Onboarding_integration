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
  String bankAppUrl = "";
  String errorDisplay = "";

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    void postData(String id) async {
      try {
        final now = DateTime.now().toIso8601String();
        String url = "http://10.136.110.36:9091/api/mbanking-service/AuthorizationService/api/v1/authorization/authorize-requests";
        
        final response = await http.post(
          Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
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
          ),
        );

        setState(() {
          final de = jsonDecode(response.body);
          bankAppUrl = de["bankAppUrl"];
          bankAppUrl = bankAppUrl.replaceAll("{Token}", de["token"]);
        });
      } catch (e) {
        setState(() {
          errorDisplay = "Error to get RTA: " + e.toString();
        });
      }
    }

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text("Identity Numbers"),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  bankAppUrl.isEmpty ? "Tap to open bank app" : bankAppUrl,
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              onTap: bankAppUrl.isEmpty ? null : () => launchUrlString(bankAppUrl),
            ),
            Text(errorDisplay),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                postData(controller.text);
              },
              child: const Text("Get RTA"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
