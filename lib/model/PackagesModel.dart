class PackagesModel {
  PackagesModel({
      this.plans,});

  PackagesModel.fromJson(dynamic json) {
    if (json['plans'] != null) {
      plans = [];
      json['plans'].forEach((v) {
        plans?.add(Plans.fromJson(v));
      });
    }
  }
  List<Plans>? plans;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (plans != null) {
      map['plans'] = plans?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Plans {
  Plans({
      this.id, 
      this.name, 
      this.icon, 
      this.description, 
      this.price, 
      this.totalHours, 
      this.maxLectures, 
      this.features, 
      this.sortOrder, 
      this.isDefault, 
      this.discount, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.iconUrl,});

  Plans.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    description = json['description'];
    price = json['price'];
    totalHours = json['total_hours'];
    maxLectures = json['max_lectures'];
    features = json['features'];
    sortOrder = json['sort_order'];
    isDefault = json['is_default'];
    discount = json['discount'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iconUrl = json['icon_url'];
  }
  int? id;
  String? name;
  String? icon;
  String? description;
  String? price;
  int? totalHours;
  int? maxLectures;
  dynamic features;
  int? sortOrder;
  int? isDefault;
  String? discount;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? iconUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['icon'] = icon;
    map['description'] = description;
    map['price'] = price;
    map['total_hours'] = totalHours;
    map['max_lectures'] = maxLectures;
    map['features'] = features;
    map['sort_order'] = sortOrder;
    map['is_default'] = isDefault;
    map['discount'] = discount;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['icon_url'] = iconUrl;
    return map;
  }

}