class SubscriptionModel {
  SubscriptionModel({
      this.subscription,});

  SubscriptionModel.fromJson(dynamic json) {
    subscription = json['subscription'] != null ? Subscription.fromJson(json['subscription']) : null;
  }
  Subscription? subscription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (subscription != null) {
      map['subscription'] = subscription?.toJson();
    }
    return map;
  }

}

class Subscription {
  Subscription({
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
      this.user, 
      this.plan, 
      this.subscriptionDetail,});

  Subscription.fromJson(dynamic json) {
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
    user = json['user'] != null ? User.fromJson(json['user']) : null;
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
  User? user;
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
    if (user != null) {
      map['user'] = user?.toJson();
    }
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

class User {
  User({
      this.id, 
      this.name, 
      this.email, 
      this.emailVerifiedAt, 
      this.avatar, 
      this.phone, 
      this.gender, 
      this.createdAt, 
      this.updatedAt, 
      this.roleId,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    avatar = json['avatar'];
    phone = json['phone'];
    gender = json['gender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    roleId = json['role_id'];
  }
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic avatar;
  String? phone;
  String? gender;
  String? createdAt;
  String? updatedAt;
  int? roleId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['avatar'] = avatar;
    map['phone'] = phone;
    map['gender'] = gender;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['role_id'] = roleId;
    return map;
  }

}