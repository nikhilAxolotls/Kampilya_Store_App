class AddMilkModel {
  String? storeId;
  String? milkmanId;
  String? supplyDate;
  String? supplyTime;
  String? milkType;
  String? quantityLitre;
  String? fat;
  String? snf;
  String? quality;

  AddMilkModel({
    this.storeId,
    this.milkmanId,
    this.supplyDate,
    this.supplyTime,
    this.milkType,
    this.quantityLitre,
    this.fat,
    this.snf,
    this.quality,
  });

  AddMilkModel.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    milkmanId = json['milkman_id'];
    supplyDate = json['supply_date'];
    supplyTime = json['supply_time'];
    milkType = json['milk_type'];
    quantityLitre = json['quantity_litre'];
    fat = json['fat'];
    snf = json['snf'];
    quality = json['quality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_id'] = this.storeId;
    data['milkman_id'] = this.milkmanId;
    data['supply_date'] = this.supplyDate;
    data['supply_time'] = this.supplyTime;
    data['milk_type'] = this.milkType?.toLowerCase();
    data['quantity_litre'] = this.quantityLitre;
    data['fat'] = this.fat;
    data['snf'] = this.snf;
    data['quality'] = this.quality;
    return data;
  }
}
