class PushNotificationRequest {
  String? billerId;
  String? transDate;
  String? transTime;
  String? termType;
  String? amount;
  String? reference1;
  String? reference2;
  String? reference3;
  String? fromBank;
  String? fromName;
  String? bankRef;
  String? approvalCode;
  String? retryFlag;

  PushNotificationRequest(
      {this.billerId,
      this.transDate,
      this.transTime,
      this.termType,
      this.amount,
      this.reference1,
      this.reference2,
      this.reference3,
      this.fromBank,
      this.fromName,
      this.bankRef,
      this.approvalCode,
      this.retryFlag});

  PushNotificationRequest.fromJson(Map<String, dynamic> json) {
    billerId = json['billerId'];
    transDate = json['transDate'];
    transTime = json['transTime'];
    termType = json['termType'];
    amount = json['amount'];
    reference1 = json['reference1'];
    reference2 = json['reference2'];
    reference3 = json['reference2'];
    fromBank = json['fromBank'];
    fromName = json['fromName'];
    bankRef = json['bankRef'];
    approvalCode = json['approvalCode'];
    retryFlag = json['retryFlag'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['billerId'] = this.billerId;
    data['transDate'] = this.transDate;
    data['transTime'] = this.transTime;
    data['termType'] = this.termType;
    data['amount'] = this.amount;
    data['reference1'] = this.reference1;
    data['reference2'] = this.reference2;
    data['reference3'] = this.reference3;
    data['fromBank'] = this.fromBank;
    data['fromName'] = this.fromName;
    data['bankRef'] = this.bankRef;
    data['approvalCode'] = this.approvalCode;
    data['retryFlag'] = this.retryFlag;
    return data;
  }
}
