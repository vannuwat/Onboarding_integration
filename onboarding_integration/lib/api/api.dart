import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:onboarding_integration/api/models/generate_easyQr_request.dart';
import 'package:onboarding_integration/api/models/generate_qr_response.dart';
import 'package:onboarding_integration/api/models/generate_qr_resquest.dart';
import 'package:onboarding_integration/api/models/inquiry_request.dart';
import 'package:onboarding_integration/api/models/inquiry_response.dart';
import 'package:onboarding_integration/api/models/otp_request_response.dart';
import 'package:onboarding_integration/api/models/otp_verifiy_request.dart';
import 'package:onboarding_integration/api/models/otp_verifiy_response.dart';
import 'package:onboarding_integration/api/models/push_notification_request.dart';
import 'package:onboarding_integration/api/models/push_notification_response.dart';
import 'package:onboarding_integration/api/models/qr_status_response.dart';
import 'package:onboarding_integration/api/models/transaction_info_response.dart';
import 'package:onboarding_integration/api/models/void_request.dart';
import 'package:onboarding_integration/api/models/void_response.dart';


String getCurrentDateTimeInFormat() {
  var now = DateTime.now();
  var formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ");
  String formatted = formatter.format(now);
  return formatted;
}

String getCurrentTimeInFormat() {
  var now = DateTime.now();
  var formatter = DateFormat('HH:mm:ss');
  String formatted = formatter.format(now);
  return formatted;
}

String getCurrentDateInFormat() {
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  String formatted = formatter.format(now);
  return formatted;
}

String generateRandomString(int length) {
  const String _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final Random _rnd = Random();

  return String.fromCharCodes(Iterable.generate(
    length, 
    (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))
  ));
}

Future<GenerateQrResponse> generateEasyQR(String money) async {

  final request = GenerateEasyQrRequest(
    amount: money,
  );

  String username = 'qrgwusr.bemerxtg';
  String password = 'P@ssw0rd';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));

  final json = request.toJson();
  final response =
      await http.post(Uri.parse('http://10.136.110.36:9091/api/youtap-qr-service'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': basicAuth,
            'Request-Ref': generateRandomString(30),
            'Transmit-Date-Time': '2024-03-15T15:23:11.001+07:00',

          },
          body: jsonEncode(json));

  // handleNotOkStatusCode(response);
  return GenerateQrResponse.fromJson(jsonDecode(response.body));
}

Future<GenerateQrResponse> generateQR(
  String amount,
  String merchantName,
  String billerId,
  String qrType,
  String promptPayRef1,
  String merchantCountry,
) async {

  final request = GenerateQrRequest(
    cardNetworkPermList: [CardNetworkPermList(cardNetworkPerm: '01')],
    requestTime: getCurrentTimeInFormat(),
    amount: amount.isEmpty ? '0' : amount,
    merchantName: merchantName.isEmpty ? 'BMNGTest' : merchantName,
    billerId: billerId.isEmpty ? '010753600037406': billerId,
    qrType: qrType.isEmpty ? 'S' : qrType,
    promptPayRef1: promptPayRef1.isEmpty ? '006001010723293' : promptPayRef1,
    promptPayRef2: generateRandomString(15),
    // promptPayRef3: promptPayRef3.isEmpty ? 'string' : promptPayRef3,
    requestDate: getCurrentDateInFormat(),
    merchantTransRef: '000000',
    merchantCountry: merchantCountry.isEmpty ? 'TH': merchantCountry,

  );
  String currentTime = '${getCurrentDateTimeInFormat()}+07:00';
  String transType = 'QRC_PYMT_TXN';
  String transCode = 'QR_GENERATE';
  String clientId = 'BBL_PROXY';  
  String username = 'qrgwusr.bemerxtg';
  String password = 'P@ssw0rd';
  String basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';

  String url = 'http://10.136.110.36:9091/api/youtap-qr-service/QRGWService/v1/TransType/$transType/TransCode/$transCode/ClientId/$clientId';
  final json = request.toJson();
  final response =
      await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': basicAuth,
            'Request-Ref': generateRandomString(30),
            'Transmit-Date-Time': currentTime,
          },
          body: jsonEncode(json));
  
  // handleNotOkStatusCode(response);

  return GenerateQrResponse.fromJson(jsonDecode(response.body));
}

Future<List<QrStatusResponse>> getQrStatus() async {
  String url = 'http://10.136.110.36:9091/api/youtap-qr-service';

  final response = await http.get(Uri.parse(url));

  List<dynamic> qrStatusList = jsonDecode(response.body);
  
  return qrStatusList.map((qrStatus) => QrStatusResponse.fromJson(qrStatus)).toList();
}



Future<List<TransactionInfoResponse>> getTransactionInfoList() async {

  const String url = 'http://10.136.110.36:9091/api/youtap-qr-service';
  String username = 'qrgwusr.bemerxtg';
  String password = 'P@ssw0rd';
  String basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';

  final response = await http.get(Uri.parse(url), headers: {
    'Content-Type' : 'application/json',
    'Authorization' : basicAuth,
  });

  List<dynamic> transactions = jsonDecode(response.body);

  return transactions
      .map((transaction) => TransactionInfoResponse.fromJson(transaction)).toList();
}

Future<InquiryResponse> inquiry(  
  String billerId,
  String promptPayRef1,
  String promptPayRef2,
  // String promptPayRef3,
  // String inquiryDate,
  // String inquiryTime,
  double amount,
  String qrCodeId,
) async {

  final request = InquiryRequest(
    billerId : billerId,
    promptPayRef1 : promptPayRef1,
    promptPayRef2: promptPayRef2,
    // promptPayRef3: promptPayRef3,
    inquiryDate: getCurrentDateInFormat(),
    inquiryTime: getCurrentTimeInFormat(),      
    amount: amount,
    qrCodeId: qrCodeId    
  );

  String username = 'qrgwusr.bemerxtg';
  String password = 'P@ssw0rd';
  String basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
  String transType = 'QRC_PYMT_TXN';
  String transCode = 'PAY_INQ';
  String clientId = 'BBL_PROXY';
  String currentTime = '${getCurrentDateTimeInFormat()}+07:00';  
  
  String url = 'http://10.136.110.36:9091/api/youtap-qr-service/QRGWService/v1/TransType/$transType/TransCode/$transCode/ClientId/$clientId';
   
  final json = request.toJson();
  final response =
      await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': basicAuth,
            'Request-Ref': generateRandomString(30),
            'Transmit-Date-Time': currentTime,
          },
          body: jsonEncode(json));

  return InquiryResponse.fromJson(jsonDecode(response.body)); 
}

Future<VoidResponse> paymentVoid(
  String billerId,
  String promptPayRef1,
  String promptPayRef2,
  // String promptPayRef3,
  String transDate,
  String transTime,
  double amount,
  String approvalCode,
  String voidCode,
) async {

  final request = VoidRequest(
    billerId : billerId,
    promptPayRef1 : promptPayRef1,
    promptPayRef2: promptPayRef2,
    // promptPayRef3: promptPayRef3,
    transDate: transDate,
    transTime: transTime,
    amount: amount,
    approvalCode: approvalCode
  );

  String username = 'qrgwusr.bemerxtg';
  String password = 'P@ssw0rd';
  String basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
  String transType = 'QRC_PYMT_TXN';
  String transCode = voidCode;
  String clientId = 'BBL_PROXY';
  String currentTime = '${getCurrentDateTimeInFormat()}+07:00';
  
  String url = 'http://10.136.110.36:9091/api/youtap-qr-service/QRGWService/v1/TransType/$transType/TransCode/$transCode/ClientId/$clientId';
   
  final json = request.toJson();
  final response =
    await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': basicAuth,
          'Request-Ref': generateRandomString(30),
          'Transmit-Date-Time': currentTime,
        },
        body: jsonEncode(json));

  dynamic voidResponse;  

  voidResponse = VoidResponse.fromJson(jsonDecode(response.body));

  return voidResponse;
}

Future<PushNotificationResponse> pushNotification(
  double amount,
  String reference1,
  String reference2,
  // String reference3
) async {

  final now = DateTime.now();
  final dateFormatted = DateFormat('yyyy-MM-dd');    
  final timeFormatted = DateFormat('HH:mm:ss');  

  final request = PushNotificationRequest(
    billerId:"010753600037406",
    transDate: dateFormatted.format(now).toString(),
    transTime: timeFormatted.format(now).toString(),
    termType:"80",
    amount: amount.toString(),
    reference1 : reference1,
    reference2 : reference2,
    // reference3 : reference3,
    fromBank : "002",
    fromName : "ABCD",
    bankRef : "",
    approvalCode : "123456",
    retryFlag : "N"
  );

  String username = 'wsuser.qrcgwx';
  String password = 'Password123';
  String basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
  String transType = 'QRC_PYMT_TXN';
  String transCode = 'NOTIFY_PPBP';
  String clientId = 'QRCHW';
  String providerId = 'BBL06QR';
  String currentTime = getCurrentTimeInFormat();
  
  String url = 'http://10.136.110.36:9091/api/trade/qrcgw-promptpay/v1/notify/transType/$transType/transCode/$transCode/clientId/$clientId/providerId/$providerId/';
  
  final json = request.toJson();
  final response =
      await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': basicAuth,
            'Request-Ref': generateRandomString(30),
            'Transmit-Date-Time': currentTime,

          },
          body: jsonEncode(json));

  return PushNotificationResponse.fromJson(jsonDecode(response.body));
 
}

Future<OtpRequestResponse> requestOtp(
  String phoneNo , 
  String language
) async {
  
  String url = 'http://10.136.110.36:9091/api/sms-service/request-otp/$phoneNo';

  final response =
      await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'text/xml',   
            'Language': language
          });

 return OtpRequestResponse.fromJson(jsonDecode(response.body));
 
}

Future<OtpVerifyResponse> verifyOtp(
  String refId,
  String otp  
) async {
  
  String url = 'http://10.136.110.36:9091/api/sms-service/verify-otp/$refId';

  final request = OtpVerifyRequest(
    otp:otp,   
  );

  final json = request.toJson();
  final response =
      await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json'
          },
          body: jsonEncode(json));

 return OtpVerifyResponse.fromJson(jsonDecode(response.body));
 
}