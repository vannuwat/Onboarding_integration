class GetRTAResponse {
  AuthorizationDetail? authorizationDetail;
  String? authorizationAccountDetails;
  String? authorizationAdditionals;

  GetRTAResponse(
      {this.authorizationDetail,
      this.authorizationAccountDetails,
      this.authorizationAdditionals});

  GetRTAResponse.fromJson(Map<String, dynamic> json) {
    authorizationDetail = json['authorizationDetail'] != null
        ? new AuthorizationDetail.fromJson(json['authorizationDetail'])
        : null;
    authorizationAccountDetails = json['authorizationAccountDetails'];
    authorizationAdditionals = json['authorizationAdditionals'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.authorizationDetail != null) {
      data['authorizationDetail'] = this.authorizationDetail!.toJson();
    }
    data['authorizationAccountDetails'] = this.authorizationAccountDetails;
    data['authorizationAdditionals'] = this.authorizationAdditionals;
    return data;
  }
}

class AuthorizationDetail {
  String? rtaId;
  String? identifier;
  String? transactionType;
  String? partnerNameTH;
  String? partnerNameEN;
  String? osPlatform;
  String? requestDateTime;
  String? expiryDateTime;
  String? partnerAppURL;
  String? status;
  String? custActionDateTime;
  String? errorCode;
  String? errorDesc;

  AuthorizationDetail(
      {this.rtaId,
      this.identifier,
      this.transactionType,
      this.partnerNameTH,
      this.partnerNameEN,
      this.osPlatform,
      this.requestDateTime,
      this.expiryDateTime,
      this.partnerAppURL,
      this.status,
      this.custActionDateTime,
      this.errorCode,
      this.errorDesc});

  AuthorizationDetail.fromJson(Map<String, dynamic> json) {
    rtaId = json['rtaId'];
    identifier = json['identifier'];
    transactionType = json['transactionType'];
    partnerNameTH = json['partnerNameTH'];
    partnerNameEN = json['partnerNameEN'];
    osPlatform = json['osPlatform'];
    requestDateTime = json['requestDateTime'];
    expiryDateTime = json['expiryDateTime'];
    partnerAppURL = json['partnerAppURL'];
    status = json['status'];
    custActionDateTime = json['custActionDateTime'];
    errorCode = json['errorCode'];
    errorDesc = json['errorDesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rtaId'] = this.rtaId;
    data['identifier'] = this.identifier;
    data['transactionType'] = this.transactionType;
    data['partnerNameTH'] = this.partnerNameTH;
    data['partnerNameEN'] = this.partnerNameEN;
    data['osPlatform'] = this.osPlatform;
    data['requestDateTime'] = this.requestDateTime;
    data['expiryDateTime'] = this.expiryDateTime;
    data['partnerAppURL'] = this.partnerAppURL;
    data['status'] = this.status;
    data['custActionDateTime'] = this.custActionDateTime;
    data['errorCode'] = this.errorCode;
    data['errorDesc'] = this.errorDesc;
    return data;
  }
}
