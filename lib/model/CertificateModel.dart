class CertificateModel {
  CertificateModel({
      this.certifications,});

  CertificateModel.fromJson(dynamic json) {
    if (json['certifications'] != null) {
      certifications = [];
      json['certifications'].forEach((v) {
        certifications?.add(Certifications.fromJson(v));
      });
    }
  }
  List<Certifications>? certifications;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (certifications != null) {
      map['certifications'] = certifications?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Certifications {
  Certifications({
      this.id, 
      this.name, 
      this.description, 
      this.createdAt, 
      this.updatedAt,});

  Certifications.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  dynamic description;
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