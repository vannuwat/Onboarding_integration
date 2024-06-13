class OtpRequestResponse {
  String? refId;

  OtpRequestResponse({this.refId});

  OtpRequestResponse.fromJson(Map<String, dynamic> json) {
    refId = json['refId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refId'] = this.refId;
    return data;
  }
}