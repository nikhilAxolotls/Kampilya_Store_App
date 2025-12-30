class MilkManModel {
  String? responseCode;
  String? result;
  String? responseMsg;
  String? date;
  double? todaysCollection;
  List<Data>? data;

  MilkManModel(
      {this.responseCode,
      this.result,
      this.responseMsg,
      this.date,
      this.todaysCollection,
      this.data});
  MilkManModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    result = json['Result'];
    responseMsg = json['ResponseMsg'];
    date = json['date'];

    todaysCollection = json['todays_collection'] != null
        ? (json['todays_collection'] as num).toDouble()
        : 0.0;

    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseCode'] = this.responseCode;
    data['Result'] = this.result;
    data['ResponseMsg'] = this.responseMsg;
    data['date'] = this.date;
    data['todays_collection'] = this.todaysCollection;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? phone;
  String? photo;
  String? address;
  String? status;
  String? createdAt;
  TodayRate? todayRate;
  double? totalSupply;
  double? totalAmount;
  double? pendingAmount;
  double? totalAvg;

  Data(
      {this.id,
      this.name,
      this.phone,
      this.photo,
      this.address,
      this.status,
      this.createdAt,
      this.todayRate,
      this.totalSupply,
      this.totalAmount,
      this.pendingAmount,
      this.totalAvg});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    photo = json['photo'];
    address = json['address'];
    status = json['status'] == "1" ? "Active" : "Inactive";
    createdAt = json['created_at'];

    todayRate = json['today_rate'] != null
        ? TodayRate.fromJson(json['today_rate'])
        : null;

    totalSupply = json['total_supply'] != null
        ? (json['total_supply'] as num).toDouble()
        : 0.0;

    totalAmount = json['total_amount'] != null
        ? (json['total_amount'] as num).toDouble()
        : 0.0;

    pendingAmount = json['pending_amount'] != null
        ? (json['pending_amount'] as num).toDouble()
        : 0.0;

    totalAvg =
        json['total_avg'] != null ? (json['total_avg'] as num).toDouble() : 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['photo'] = this.photo;
    data['address'] = this.address;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    if (this.todayRate != null) {
      data['today_rate'] = this.todayRate!.toJson();
    }
    data['total_supply'] = this.totalSupply;
    data['total_amount'] = this.totalAmount;
    data['pending_amount'] = this.pendingAmount;
    data['total_avg'] = this.totalAvg;
    return data;
  }
}

class TodayRate {
  String? cow;
  String? buffalo;

  TodayRate({this.cow, this.buffalo});

  TodayRate.fromJson(Map<String, dynamic> json) {
    cow = json['cow']?.toString();
    buffalo = json['buffalo']?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cow'] = this.cow;
    data['buffalo'] = this.buffalo;
    return data;
  }
}
