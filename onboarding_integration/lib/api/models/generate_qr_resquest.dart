class GenerateQrRequest {
  List<CardNetworkPermList>? cardNetworkPermList;
  String? requestTime;
  String? amount;
  String? merchantName;
  String? billerId;
  String? qrType;
  String? promptPayRef1;
  String? promptPayRef2;
  // String? promptPayRef3;
  String? requestDate;
  String? merchantTransRef;
  String? merchantCountry;

  GenerateQrRequest(
      {this.cardNetworkPermList,
      this.requestTime,
      this.amount,
      this.merchantName,
      this.billerId,
      this.qrType,
      this.promptPayRef1,
      this.promptPayRef2,
      // this.promptPayRef3,
      this.requestDate,
      this.merchantTransRef,
      this.merchantCountry});

  GenerateQrRequest.fromJson(Map<String, dynamic> json) {
    if (json['cardNetworkPermList'] != null) {
      cardNetworkPermList = <CardNetworkPermList>[];
      json['cardNetworkPermList'].forEach((v) {
        cardNetworkPermList!.add(new CardNetworkPermList.fromJson(v));
      });
    }
    requestTime = json['requestTime'];
    amount = json['amount'];
    merchantName = json['merchantName'];
    billerId = json['billerId'];
    qrType = json['qrType'];
    promptPayRef1 = json['promptPayRef1'];
    promptPayRef2 = json['promptPayRef2'];
    // promptPayRef3 = json['promptPayRef3'];
    requestDate = json['requestDate'];
    merchantTransRef = json['merchantTransRef'];
    merchantCountry = json['merchantCountry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cardNetworkPermList != null) {
      data['cardNetworkPermList'] =
          this.cardNetworkPermList!.map((v) => v.toJson()).toList();
    }
    data['requestTime'] = this.requestTime;
    data['amount'] = this.amount;
    data['merchantName'] = this.merchantName;
    data['billerId'] = this.billerId;
    data['qrType'] = this.qrType;
    data['promptPayRef1'] = this.promptPayRef1;
    data['promptPayRef2'] = this.promptPayRef2;
    // data['promptPayRef3'] = this.promptPayRef3;
    data['requestDate'] = this.requestDate;
    data['merchantTransRef'] = this.merchantTransRef;
    data['merchantCountry'] = this.merchantCountry;
    return data;
  }
}

class CardNetworkPermList {
  String? cardNetworkPerm;

  CardNetworkPermList({this.cardNetworkPerm});

  CardNetworkPermList.fromJson(Map<String, dynamic> json) {
    cardNetworkPerm = json['cardNetworkPerm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardNetworkPerm'] = this.cardNetworkPerm;
    return data;
  }
}
