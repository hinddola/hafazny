// class TeacherProfile {
//   TeacherProfile({
//       this.userId,
//       this.bio,
//       this.educationLevelId,
//       this.updatedAt,
//       this.createdAt,
//       this.id,});
//
//   TeacherProfile.fromJson(dynamic json) {
//     userId = json['user_id'];
//     bio = json['bio'];
//     educationLevelId = json['education_level_id'];
//     updatedAt = json['updated_at'];
//     createdAt = json['created_at'];
//     id = json['id'];
//   }
//   int? userId;
//   String? bio;
//   int? educationLevelId;
//   String? updatedAt;
//   String? createdAt;
//   int? id;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['user_id'] = userId;
//     map['bio'] = bio;
//     map['education_level_id'] = educationLevelId;
//     map['updated_at'] = updatedAt;
//     map['created_at'] = createdAt;
//     map['id'] = id;
//     return map;
//   }
//
// }