class VoidResponse {
  Data? data;
  String? responseMesg;
  String? responseCode;

  VoidResponse({this.data, this.responseMesg, this.responseCode});

  VoidResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    responseMesg = json['responseMesg'];
    responseCode = json['responseCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['responseMesg'] = this.responseMesg;
    data['responseCode'] = this.responseCode;
    return data;
  }
}

class Data {
  String? billerId;
  String? promptPayRef1;
  String? promptPayRef2;
  int? amount;
  String? transactionId;

  Data(
      {this.billerId,
      this.promptPayRef1,
      this.promptPayRef2,
      this.amount,
      this.transactionId});

  Data.fromJson(Map<String, dynamic> json) {
    billerId = json['billerId'];
    promptPayRef1 = json['promptPayRef1'];
    promptPayRef2 = json['promptPayRef2'];
    amount = json['amount'];
    transactionId = json['transactionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['billerId'] = this.billerId;
    data['promptPayRef1'] = this.promptPayRef1;
    data['promptPayRef2'] = this.promptPayRef2;
    data['amount'] = this.amount;
    data['transactionId'] = this.transactionId;
    return data;
  }
}