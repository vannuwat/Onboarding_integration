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
  String token = "";
  String bankAppUrl = "";
  String errorDisplay = "";
  String rtaGetStatusResponse = "";

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    void postData(String id) async {
      try {
        final now = DateTime.now().toIso8601String();
        String url =
            "http://10.136.110.36:9091/api/mbanking-service/AuthorizationService/api/v1/authorization/authorize-requests";
        String callbackUrl = "thisapp://";

        final response = await http.post(Uri.parse(url),
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
                  "osPlatform": "ANDROID",
                  "partnerAppUrl": callbackUrl
                },
                "channelHeader": {
                  "correlationId": const Uuid().v4(),
                  "customerId": "0000202130118815",
                  "requestDateTime": now,
                  "language": "TH-th"
                }
              },
            ));
        setState(() {
          final de = jsonDecode(response.body);
          token = de["token"];
          bankAppUrl = de["bankAppUrl"];
          // "bankAppUrl": "bualuangmbankingapp://mbanking.beMerchantAuthen?token={Token}",

          bankAppUrl =
              "${bankAppUrl.replaceAll("{Token}", de["token"])}&callback_url=${Uri.encodeComponent(callbackUrl)}";
        });
      } catch (e) {
        setState(() {
          errorDisplay = "error to get RTA: $e";
        });
      }
    }

    void getData(String token) async {
      try {
        String url =
            "http://10.136.110.36:9091/api/mbanking-service/AuthorizationService/api/v1/authorization/authorize-requests?token=$token";

        final response = await http.get(
          Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        );
        setState(() {
          final de = jsonDecode(response.body);
          rtaGetStatusResponse = de.toString();
        });
      } catch (e) {
        setState(() {
          errorDisplay = "error to get RTA: $e";
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
                    child: Text(bankAppUrl)),
                onTap: () => launchUrlString(bankAppUrl)),
            Text(errorDisplay),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  postData(controller.text);
                },
                child: const Text("Request RTA")),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  getData(token);
                },
                child: const Text("Get RTA Status")),
            const SizedBox(height: 20),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(rtaGetStatusResponse)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
