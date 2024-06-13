class InquiryRequest {
  String? transDate;
  String? billerId;
  String? promptPayRef1;
  String? promptPayRef2;
  // String? promptPayRef3;
  String? inquiryDate;
  String? inquiryTime;
  double? amount;
  String? qrCodeId;

  InquiryRequest(
      {this.transDate,
      this.billerId,
      this.promptPayRef1,
      this.promptPayRef2,
      // this.promptPayRef3,
      this.inquiryDate,
      this.inquiryTime,
      this.amount,
      this.qrCodeId});

  InquiryRequest.fromJson(Map<String, dynamic> json) {
    transDate = json['transDate'];
    billerId = json['billerId'];
    promptPayRef1 = json['promptPayRef1'];
    promptPayRef2 = json['promptPayRef2'];
    // promptPayRef3 = json['promptPayRef3'];
    inquiryDate = json['inquiryDate'];
    inquiryTime = json['inquiryTime'];
    amount = json['amount'];
    qrCodeId = json['qrCodeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transDate'] = this.transDate;
    data['billerId'] = this.billerId;
    data['promptPayRef1'] = this.promptPayRef1;
    data['promptPayRef2'] = this.promptPayRef2;
    // data['promptPayRef3'] = this.promptPayRef3;
    data['inquiryDate'] = this.inquiryDate;
    data['inquiryTime'] = this.inquiryTime;
    data['amount'] = this.amount;
    data['qrCodeId'] = this.qrCodeId;
    return data;
  }
}