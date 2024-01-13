class TeacherProfileModel {
  TeacherProfileModel({
      this.teacherProfile,});

  TeacherProfileModel.fromJson(dynamic json) {
    teacherProfile = json['teacherProfile'] != null ? TeacherProfile.fromJson(json['teacherProfile']) : null;
  }
  TeacherProfile? teacherProfile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (teacherProfile != null) {
      map['teacherProfile'] = teacherProfile?.toJson();
    }
    return map;
  }

}

class TeacherProfile {
  TeacherProfile({
      this.id, 
      this.userId, 
      this.bio, 
      this.educationLevelId, 
      this.createdAt, 
      this.updatedAt, 
      this.user, 
      this.educationLevel,});

  TeacherProfile.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    bio = json['bio'];
    educationLevelId = json['education_level_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    educationLevel = json['education_level'] != null ? EducationLevel.fromJson(json['education_level']) : null;
  }
  int? id;
  int? userId;
  String? bio;
  int? educationLevelId;
  String? createdAt;
  String? updatedAt;
  User? user;
  EducationLevel? educationLevel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['bio'] = bio;
    map['education_level_id'] = educationLevelId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (educationLevel != null) {
      map['education_level'] = educationLevel?.toJson();
    }
    return map;
  }

}

class EducationLevel {
  EducationLevel({
      this.id, 
      this.name, 
      this.description, 
      this.createdAt, 
      this.updatedAt,});

  EducationLevel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
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