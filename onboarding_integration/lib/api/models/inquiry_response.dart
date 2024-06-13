class InquiryResponse {
  Data? data;
  String? responseMesg;
  String? responseCode;

  InquiryResponse({this.data, this.responseMesg, this.responseCode});

  InquiryResponse.fromJson(Map<String, dynamic> json) {
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
  String? approvalCode;
  String? transDate;
  String? transTime;
  String? statusCode;
  String? statusMesg;
  int? transFee;
  String? cardNetworkCode;
  String? termType;
  String? fromBank;
  String? fromName;
  String? bankRef;

  Data(
      {this.billerId,
      this.promptPayRef1,
      this.promptPayRef2,
      this.amount,
      this.transactionId,
      this.approvalCode,
      this.transDate,
      this.transTime,
      this.statusCode,
      this.statusMesg,
      this.transFee,
      this.cardNetworkCode,
      this.termType,
      this.fromBank,
      this.fromName,
      this.bankRef});

  Data.fromJson(Map<String, dynamic> json) {
    billerId = json['billerId'];
    promptPayRef1 = json['promptPayRef1'];
    promptPayRef2 = json['promptPayRef2'];
    amount = json['amount'];
    transactionId = json['transactionId'];
    approvalCode = json['approvalCode'];
    transDate = json['transDate'];
    transTime = json['transTime'];
    statusCode = json['statusCode'];
    statusMesg = json['statusMesg'];
    transFee = json['transFee'];
    cardNetworkCode = json['cardNetworkCode'];
    termType = json['termType'];
    fromBank = json['fromBank'];
    fromName = json['fromName'];
    bankRef = json['bankRef'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['billerId'] = this.billerId;
    data['promptPayRef1'] = this.promptPayRef1;
    data['promptPayRef2'] = this.promptPayRef2;
    data['amount'] = this.amount;
    data['transactionId'] = this.transactionId;
    data['approvalCode'] = this.approvalCode;
    data['transDate'] = this.transDate;
    data['transTime'] = this.transTime;
    data['statusCode'] = this.statusCode;
    data['statusMesg'] = this.statusMesg;
    data['transFee'] = this.transFee;
    data['cardNetworkCode'] = this.cardNetworkCode;
    data['termType'] = this.termType;
    data['fromBank'] = this.fromBank;
    data['fromName'] = this.fromName;
    data['bankRef'] = this.bankRef;
    return data;
  }
}