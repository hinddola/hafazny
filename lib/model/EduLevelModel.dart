class EduLevelModel {
  EduLevelModel({
      this.educationLevels,});

  EduLevelModel.fromJson(dynamic json) {
    if (json['education_levels'] != null) {
      educationLevels = [];
      json['education_levels'].forEach((v) {
        educationLevels?.add(EducationLevels.fromJson(v));
      });
    }
  }
  List<EducationLevels>? educationLevels;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (educationLevels != null) {
      map['education_levels'] = educationLevels?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class EducationLevels {
  EducationLevels({
      this.id, 
      this.name, 
      this.description, 
      this.createdAt, 
      this.updatedAt,});

  EducationLevels.fromJson(dynamic json) {
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