class FavouriteTeachersModel {
  FavouriteTeachersModel({
      this.favoriteTeachers,});

  FavouriteTeachersModel.fromJson(dynamic json) {
    if (json['favorite_teachers'] != null) {
      favoriteTeachers = [];
      json['favorite_teachers'].forEach((v) {
        favoriteTeachers?.add(FavoriteTeachers.fromJson(v));
      });
    }
  }
  List<FavoriteTeachers>? favoriteTeachers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (favoriteTeachers != null) {
      map['favorite_teachers'] = favoriteTeachers?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class FavoriteTeachers {
  FavoriteTeachers({
      this.id, 
      this.userId, 
      this.teacherId, 
      this.createdAt, 
      this.updatedAt, 
      this.teacher,});

  FavoriteTeachers.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    teacherId = json['teacher_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    teacher = json['teacher'] != null ? Teacher.fromJson(json['teacher']) : null;
  }
  int? id;
  int? userId;
  int? teacherId;
  String? createdAt;
  String? updatedAt;
  Teacher? teacher;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['teacher_id'] = teacherId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (teacher != null) {
      map['teacher'] = teacher?.toJson();
    }
    return map;
  }

}

class Teacher {
  Teacher({
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

  Teacher.fromJson(dynamic json) {
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