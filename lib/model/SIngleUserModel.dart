class SIngleUserModel {
  SIngleUserModel({
      this.userPaths,});

  SIngleUserModel.fromJson(dynamic json) {
    if (json['user_paths'] != null) {
      userPaths = [];
      json['user_paths'].forEach((v) {
        userPaths?.add(UserPaths.fromJson(v));
      });
    }
  }
  List<UserPaths>? userPaths;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (userPaths != null) {
      map['user_paths'] = userPaths?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class UserPaths {
  UserPaths({
      this.id, 
      this.userId, 
      this.pathId, 
      this.pathItemId, 
      this.createdAt, 
      this.updatedAt,});

  UserPaths.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    pathId = json['path_id'];
    pathItemId = json['path_item_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? userId;
  int? pathId;
  int? pathItemId;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['path_id'] = pathId;
    map['path_item_id'] = pathItemId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}