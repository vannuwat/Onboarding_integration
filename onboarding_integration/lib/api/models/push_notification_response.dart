class PushNotificationResponse {
  String? responseMesg;
  String? responseCode;

  PushNotificationResponse({this.responseMesg, this.responseCode});

  PushNotificationResponse.fromJson(Map<String, dynamic> json) {
    responseMesg = json['responseMesg'];
    responseCode = json['responseCode'];
  }   
}
   
