class VoidRequest {
  String? billerId;
  String? promptPayRef1;
  String? promptPayRef2;
  // String? promptPayRef3;
  String? transDate;
  String? transTime;
  double? amount;
  String? approvalCode;

  VoidRequest(
      {this.billerId,
      this.promptPayRef1,
      this.promptPayRef2,
      // this.promptPayRef3,
      this.transDate,
      this.transTime,
      this.amount,
      this.approvalCode});

  VoidRequest.fromJson(Map<String, dynamic> json) {
    billerId = json['billerId'];
    promptPayRef1 = json['promptPayRef1'];
    promptPayRef2 = json['promptPayRef2'];
    // promptPayRef3 = json['promptPayRef3'];
    transDate = json['transDate'];
    transTime = json['transTime'];
    amount = json['amount'];
    approvalCode = json['approvalCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['billerId'] = this.billerId;
    data['promptPayRef1'] = this.promptPayRef1;
    data['promptPayRef2'] = this.promptPayRef2;
    // data['promptPayRef3'] = this.promptPayRef3;
    data['transDate'] = this.transDate;
    data['transTime'] = this.transTime;
    data['amount'] = this.amount;
    data['approvalCode'] = this.approvalCode;
    return data;
  }
}