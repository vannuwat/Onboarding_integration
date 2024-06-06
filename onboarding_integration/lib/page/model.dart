class GetRTARequest {
  PartnerInfo? partnerInfo;
  RtaInfo? rtaInfo;
  CallBackInfo? callBackInfo;
  ChannelHeader? channelHeader;

  GetRTARequest(
      {this.partnerInfo, this.rtaInfo, this.callBackInfo, this.channelHeader});

  GetRTARequest.fromJson(Map<String, dynamic> json) {
    partnerInfo = json['partnerInfo'] != null
        ? new PartnerInfo.fromJson(json['partnerInfo'])
        : null;
    rtaInfo =
        json['rtaInfo'] != null ? new RtaInfo.fromJson(json['rtaInfo']) : null;
    callBackInfo = json['callBackInfo'] != null
        ? new CallBackInfo.fromJson(json['callBackInfo'])
        : null;
    channelHeader = json['channelHeader'] != null
        ? new ChannelHeader.fromJson(json['channelHeader'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.partnerInfo != null) {
      data['partnerInfo'] = this.partnerInfo!.toJson();
    }
    if (this.rtaInfo != null) {
      data['rtaInfo'] = this.rtaInfo!.toJson();
    }
    if (this.callBackInfo != null) {
      data['callBackInfo'] = this.callBackInfo!.toJson();
    }
    if (this.channelHeader != null) {
      data['channelHeader'] = this.channelHeader!.toJson();
    }
    return data;
  }
}

class PartnerInfo {
  String? partnerNameTH;
  String? partnerNameEN;

  PartnerInfo({this.partnerNameTH, this.partnerNameEN});

  PartnerInfo.fromJson(Map<String, dynamic> json) {
    partnerNameTH = json['partnerNameTH'];
    partnerNameEN = json['partnerNameEN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['partnerNameTH'] = this.partnerNameTH;
    data['partnerNameEN'] = this.partnerNameEN;
    return data;
  }
}

class RtaInfo {
  String? identifier;
  String? requestDateTime;
  String? transType;

  RtaInfo({this.identifier, this.requestDateTime, this.transType});

  RtaInfo.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'];
    requestDateTime = json['requestDateTime'];
    transType = json['transType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = this.identifier;
    data['requestDateTime'] = this.requestDateTime;
    data['transType'] = this.transType;
    return data;
  }
}

class CallBackInfo {
  String? osPlatform;
  String? partnerAppUrl;

  CallBackInfo({this.osPlatform, this.partnerAppUrl});

  CallBackInfo.fromJson(Map<String, dynamic> json) {
    osPlatform = json['osPlatform'];
    partnerAppUrl = json['partnerAppUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['osPlatform'] = this.osPlatform;
    data['partnerAppUrl'] = this.partnerAppUrl;
    return data;
  }
}

class ChannelHeader {
  String? correlationId;
  String? customerId;
  String? requestDateTime;
  String? language;

  ChannelHeader(
      {this.correlationId,
      this.customerId,
      this.requestDateTime,
      this.language});

  ChannelHeader.fromJson(Map<String, dynamic> json) {
    correlationId = json['correlationId'];
    customerId = json['customerId'];
    requestDateTime = json['requestDateTime'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['correlationId'] = this.correlationId;
    data['customerId'] = this.customerId;
    data['requestDateTime'] = this.requestDateTime;
    data['language'] = this.language;
    return data;
  }
}
