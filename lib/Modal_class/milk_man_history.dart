class MilkManHistory {
  String? responseCode;
  String? result;
  String? responseMsg;
  List<HistoryData>? data;

  MilkManHistory({this.responseCode, this.result, this.responseMsg, this.data});

  MilkManHistory.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    result = json['Result'];
    responseMsg = json['ResponseMsg'];
    if (json['data'] != null) {
      data = <HistoryData>[];
      json['data'].forEach((v) {
        data!.add(new HistoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseCode'] = this.responseCode;
    data['Result'] = this.result;
    data['ResponseMsg'] = this.responseMsg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HistoryData {
  String? id;
  String? storeId;
  String? milkmanId;
  String? supplyDate;
  String? milkType;
  String? todaysRate;
  String? quantityLitre;
  String? totalPrice;
  String? fat;
  String? snf;
  String? quality;
  String? createdAt;
  String? milkmanName;
  String? milkmanPhone;
  String? milkmanEmail;
  String? pricePerLitre;
  String? status;
  String? supplyTime;

  HistoryData({
    this.id,
    this.storeId,
    this.milkmanId,
    this.supplyDate,
    this.milkType,
    this.todaysRate,
    this.quantityLitre,
    this.totalPrice,
    this.fat,
    this.snf,
    this.quality,
    this.createdAt,
    this.milkmanName,
    this.milkmanPhone,
    this.milkmanEmail,
    this.pricePerLitre,
    this.status,
    this.supplyTime,
  });

  HistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeId = json['store_id'];
    milkmanId = json['milkman_id'];
    supplyDate = json['supply_date'];
    milkType = json['milk_type'];
    todaysRate = json['todays_rate'] ?? "0";
    quantityLitre = json['quantity_litre'] ?? "0 L";
    totalPrice = json['total_price'] ?? "0";
    fat = json['fat'];
    snf = json['snf'];
    quality = json['quality'];
    createdAt = json['created_at'];
    milkmanName = json['milkman_name'];
    milkmanPhone = json['milkman_phone'];
    milkmanEmail = json['milkman_email'];
    pricePerLitre = json['price_per_litre'];
    status = json['status'] ?? "Collected";
    supplyTime = json['supply_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['store_id'] = this.storeId;
    data['milkman_id'] = this.milkmanId;
    data['supply_date'] = this.supplyDate;
    data['milk_type'] = this.milkType;
    data['todays_rate'] = this.todaysRate;
    data['quantity_litre'] = this.quantityLitre;
    data['total_price'] = this.totalPrice;
    data['fat'] = this.fat;
    data['snf'] = this.snf;
    data['quality'] = this.quality;
    data['created_at'] = this.createdAt;
    data['milkman_name'] = this.milkmanName;
    data['milkman_phone'] = this.milkmanPhone;
    data['milkman_email'] = this.milkmanEmail;
    data['price_per_litre'] = this.pricePerLitre;
    data['status'] = this.status;
    data['supply_time'] = this.supplyTime;
    return data;
  }
}
