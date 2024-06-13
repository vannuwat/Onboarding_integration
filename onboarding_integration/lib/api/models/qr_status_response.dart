class QrStatusResponse {
  String? id;
  String? requestRef;
  String? createdAt;
  String? updatedAt;
  String? qrType;
  String? billerId;
  String? promptPayRef1;
  String? promptPayRef2;
  String? promptPayRef3;
  String? merchantId;
  String? merchantTransRef;
  String? requestDate;
  String? requestTime;
  double? amountCreated;
  double? amountPaid;
  String? merchantCountry;
  String? merchantName;
  String? status;
  String? notificationRequestId;

  QrStatusResponse(
      {this.id,
      this.requestRef,
      this.createdAt,
      this.updatedAt,
      this.qrType,
      this.billerId,
      this.promptPayRef1,
      this.promptPayRef2,
      this.promptPayRef3,
      this.merchantId,
      this.merchantTransRef,
      this.requestDate,
      this.requestTime,
      this.amountCreated,
      this.amountPaid,
      this.merchantCountry,
      this.merchantName,
      this.status,
      this.notificationRequestId});

  QrStatusResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    requestRef = json['requestRef'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    qrType = json['qrType'];
    billerId = json['billerId'];
    promptPayRef1 = json['promptPayRef1'];
    promptPayRef2 = json['promptPayRef2'];
    promptPayRef3 = json['promptPayRef3'];
    merchantId = json['merchantId'];
    merchantTransRef = json['merchantTransRef'];
    requestDate = json['requestDate'];
    requestTime = json['requestTime'];
    amountCreated = json['amountCreated'];
    amountPaid = json['amountPaid'];
    merchantCountry = json['merchantCountry'];
    merchantName = json['merchantName'];
    status = json['status'];
    notificationRequestId = json['notificationRequestId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['requestRef'] = this.requestRef;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['qrType'] = this.qrType;
    data['billerId'] = this.billerId;
    data['promptPayRef1'] = this.promptPayRef1;
    data['promptPayRef2'] = this.promptPayRef2;
    data['promptPayRef3'] = this.promptPayRef3;
    data['merchantId'] = this.merchantId;
    data['merchantTransRef'] = this.merchantTransRef;
    data['requestDate'] = this.requestDate;
    data['requestTime'] = this.requestTime;
    data['amountCreated'] = this.amountCreated;
    data['amountPaid'] = this.amountPaid;
    data['merchantCountry'] = this.merchantCountry;
    data['merchantName'] = this.merchantName;
    data['status'] = this.status;
    data['notificationRequestId'] = this.notificationRequestId;
    return data;
  }
}
