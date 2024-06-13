class GenerateQrResponse {
  Data? data;
  String? responseMesg;
  String? responseCode;

  GenerateQrResponse({this.data, this.responseMesg, this.responseCode});

  GenerateQrResponse.fromJson(Map<String, dynamic> json) {
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
  // String? promptPayRef3;
  String? merchantTransRef;
  double? amount;
  String? qrCodeId;
  String? qrReference;
  String? qrData;
  String? showThaiQrLogo;
  List<CardNetworkList>? cardNetworkList;

  Data(
      {this.billerId,
      this.promptPayRef1,
      this.promptPayRef2,
      // this.promptPayRef3,
      this.merchantTransRef,
      this.amount,
      this.qrCodeId,
      this.qrReference,
      this.qrData,
      this.showThaiQrLogo,
      this.cardNetworkList});

  Data.fromJson(Map<String, dynamic> json) {
    billerId = json['billerId'];
    promptPayRef1 = json['promptPayRef1'];
    promptPayRef2 = json['promptPayRef2'];
    // promptPayRef3 = json['promptPayRef3'];
    merchantTransRef = json['merchantTransRef'];
    amount = json['amount'];
    qrCodeId = json['qrCodeId'];
    qrReference = json['qrReference'];
    qrData = json['qrData'];
    showThaiQrLogo = json['showThaiQrLogo'];
    if (json['cardNetworkList'] != null) {
      cardNetworkList = <CardNetworkList>[];
      json['cardNetworkList'].forEach((v) {
        cardNetworkList!.add(new CardNetworkList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['billerId'] = this.billerId;
    data['promptPayRef1'] = this.promptPayRef1;
    data['promptPayRef2'] = this.promptPayRef2;
    // data['promptPayRef3'] = this.promptPayRef3;
    data['merchantTransRef'] = this.merchantTransRef;
    data['amount'] = this.amount;
    data['qrCodeId'] = this.qrCodeId;
    data['qrReference'] = this.qrReference;
    data['qrData'] = this.qrData;
    data['showThaiQrLogo'] = this.showThaiQrLogo;
    if (this.cardNetworkList != null) {
      data['cardNetworkList'] =
          this.cardNetworkList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CardNetworkList {
  String? cardNetworkCode;

  CardNetworkList({this.cardNetworkCode});

  CardNetworkList.fromJson(Map<String, dynamic> json) {
    cardNetworkCode = json['cardNetworkCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardNetworkCode'] = this.cardNetworkCode;
    return data;
  }
}

// class GenerateQrResponse {
//   String? responseCode;
//   String? responseMesg;
//   Data? data;

//   GenerateQrResponse({this.responseCode, this.responseMesg, this.data});

//   GenerateQrResponse.fromJson(Map<String, dynamic> json) {
//     responseCode = json['responseCode'];
//     responseMesg = json['responseMesg'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['responseCode'] = this.responseCode;
//     data['responseMesg'] = this.responseMesg;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   String? merchantId;
//   String? merchantTransRef;
//   String? terminalId;
//   double? amount;
//   String? qrCodeId;
//   String? qrReference;
//   String? qrData;
//   String? showThaiQrLogo;
//   List<CardNetworkList>? cardNetworkList;

//   Data(
//       {this.merchantId,
//       this.merchantTransRef,
//       this.terminalId,
//       this.amount,
//       this.qrCodeId,
//       this.qrReference,
//       this.qrData,
//       this.showThaiQrLogo,
//       this.cardNetworkList});

//   Data.fromJson(Map<String, dynamic> json) {
//     merchantId = json['merchantId'];
//     merchantTransRef = json['merchantTransRef'];
//     terminalId = json['terminalId'];
//     amount = json['amount'];
//     qrCodeId = json['qrCodeId'];
//     qrReference = json['qrReference'];
//     qrData = json['qrData'];
//     showThaiQrLogo = json['showThaiQrLogo'];
//     if (json['cardNetworkList'] != null) {
//       cardNetworkList = <CardNetworkList>[];
//       json['cardNetworkList'].forEach((v) {
//         cardNetworkList!.add(new CardNetworkList.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['merchantId'] = this.merchantId;
//     data['merchantTransRef'] = this.merchantTransRef;
//     data['terminalId'] = this.terminalId;
//     data['amount'] = this.amount;
//     data['qrCodeId'] = this.qrCodeId;
//     data['qrReference'] = this.qrReference;
//     data['qrData'] = this.qrData;
//     data['showThaiQrLogo'] = this.showThaiQrLogo;
//     if (this.cardNetworkList != null) {
//       data['cardNetworkList'] =
//           this.cardNetworkList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class CardNetworkList {
//   String? cardNetworkCode;

//   CardNetworkList({this.cardNetworkCode});

//   CardNetworkList.fromJson(Map<String, dynamic> json) {
//     cardNetworkCode = json['cardNetworkCode'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['cardNetworkCode'] = this.cardNetworkCode;
//     return data;
//   }
// }
