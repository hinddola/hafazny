class UserModel {
  UserModel({
      this.message, 
      this.user, 
      this.token,});

  UserModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

class User {
  User({
      this.name, 
      this.email, 
      this.roleId, 
      this.phone, 
      this.gender, 
      this.updatedAt, 
      this.createdAt, 
      this.id,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    roleId = json['role_id'];
    phone = json['phone'];
    gender = json['gender'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  String? name;
  String? email;
  int? roleId;
  String? phone;
  String? gender;
  String? updatedAt;
  String? createdAt;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role_id'] = roleId;
    map['phone'] = phone;
    map['gender'] = gender;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }

}