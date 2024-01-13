class TeachersDetailesModel {
  TeachersDetailesModel({
      this.teachers,});

  TeachersDetailesModel.fromJson(dynamic json) {
    if (json['teachers'] != null) {
      teachers = [];
      json['teachers'].forEach((v) {
        teachers?.add(Teachers.fromJson(v));
      });
    }
  }
  List<Teachers>? teachers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (teachers != null) {
      map['teachers'] = teachers?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Teachers {
  Teachers({
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

  Teachers.fromJson(dynamic json) {
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