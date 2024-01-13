class UserSubscriptionsList {
  UserSubscriptionsList({
      this.userSubscriptions,});

  UserSubscriptionsList.fromJson(dynamic json) {
    if (json['userSubscriptions'] != null) {
      userSubscriptions = [];
      json['userSubscriptions'].forEach((v) {
        userSubscriptions?.add(UserSubscriptions.fromJson(v));
      });
    }
  }
  List<UserSubscriptions>? userSubscriptions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (userSubscriptions != null) {
      map['userSubscriptions'] = userSubscriptions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class UserSubscriptions {
  UserSubscriptions({
      this.id, 
      this.userId, 
      this.planId, 
      this.startDate, 
      this.endDate, 
      this.isActive, 
      this.paymentStatus, 
      this.paymentMethod, 
      this.autoRenew, 
      this.cancellationReason, 
      this.subscriptionType, 
      this.couponsUsed, 
      this.upgradeFromSubscriptionId, 
      this.downgradeToSubscriptionId, 
      this.billingCycle, 
      this.externalSubscriptionId, 
      this.createdAt, 
      this.updatedAt, 
      this.plan, 
      this.subscriptionDetail,});

  UserSubscriptions.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    planId = json['plan_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    isActive = json['is_active'];
    paymentStatus = json['payment_status'];
    paymentMethod = json['payment_method'];
    autoRenew = json['auto_renew'];
    cancellationReason = json['cancellation_reason'];
    subscriptionType = json['subscription_type'];
    couponsUsed = json['coupons_used'];
    upgradeFromSubscriptionId = json['upgrade_from_subscription_id'];
    downgradeToSubscriptionId = json['downgrade_to_subscription_id'];
    billingCycle = json['billing_cycle'];
    externalSubscriptionId = json['external_subscription_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    plan = json['plan'] != null ? Plan.fromJson(json['plan']) : null;
    subscriptionDetail = json['subscription_detail'] != null ? SubscriptionDetail.fromJson(json['subscription_detail']) : null;
  }
  int? id;
  int? userId;
  int? planId;
  String? startDate;
  String? endDate;
  int? isActive;
  String? paymentStatus;
  String? paymentMethod;
  int? autoRenew;
  dynamic cancellationReason;
  String? subscriptionType;
  dynamic couponsUsed;
  dynamic upgradeFromSubscriptionId;
  dynamic downgradeToSubscriptionId;
  String? billingCycle;
  String? externalSubscriptionId;
  String? createdAt;
  String? updatedAt;
  Plan? plan;
  SubscriptionDetail? subscriptionDetail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['plan_id'] = planId;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    map['is_active'] = isActive;
    map['payment_status'] = paymentStatus;
    map['payment_method'] = paymentMethod;
    map['auto_renew'] = autoRenew;
    map['cancellation_reason'] = cancellationReason;
    map['subscription_type'] = subscriptionType;
    map['coupons_used'] = couponsUsed;
    map['upgrade_from_subscription_id'] = upgradeFromSubscriptionId;
    map['downgrade_to_subscription_id'] = downgradeToSubscriptionId;
    map['billing_cycle'] = billingCycle;
    map['external_subscription_id'] = externalSubscriptionId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (plan != null) {
      map['plan'] = plan?.toJson();
    }
    if (subscriptionDetail != null) {
      map['subscription_detail'] = subscriptionDetail?.toJson();
    }
    return map;
  }

}

class SubscriptionDetail {
  SubscriptionDetail({
      this.id, 
      this.subscriptionId, 
      this.totalHours, 
      this.remainingHours, 
      this.maxLectures, 
      this.createdAt, 
      this.updatedAt,});

  SubscriptionDetail.fromJson(dynamic json) {
    id = json['id'];
    subscriptionId = json['subscription_id'];
    totalHours = json['total_hours'];
    remainingHours = json['remaining_hours'];
    maxLectures = json['max_lectures'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? subscriptionId;
  String? totalHours;
  String? remainingHours;
  String? maxLectures;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['subscription_id'] = subscriptionId;
    map['total_hours'] = totalHours;
    map['remaining_hours'] = remainingHours;
    map['max_lectures'] = maxLectures;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

class Plan {
  Plan({
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
      this.updatedAt,});

  Plan.fromJson(dynamic json) {
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
    return map;
  }

}