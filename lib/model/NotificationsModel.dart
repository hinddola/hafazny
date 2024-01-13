class NotificationsModel {
  NotificationsModel({
      this.notifications,});

  NotificationsModel.fromJson(dynamic json) {
    if (json['notifications'] != null) {
      notifications = [];
      json['notifications'].forEach((v) {
        notifications?.add(Notifications.fromJson(v));
      });
    }
  }
  List<Notifications>? notifications;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (notifications != null) {
      map['notifications'] = notifications?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Notifications {
  Notifications({
      this.id, 
      this.title, 
      this.message, 
      this.targetType, 
      this.targetId, 
      this.createdAt, 
      this.updatedAt,});

  Notifications.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    targetType = json['target_type'];
    targetId = json['target_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? title;
  String? message;
  String? targetType;
  int? targetId;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['message'] = message;
    map['target_type'] = targetType;
    map['target_id'] = targetId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}