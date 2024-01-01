class PathItems {
  int? id;
  int? pathId;
  String? title;
  String? description;
  int? order;
  String? status;
  String? createdAt;
  String? updatedAt;

  PathItems({
    this.id,
    this.pathId,
    this.title,
    this.description,
    this.order,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  PathItems.fromJson(dynamic json) {
    id = json['id'] as int?;
    pathId = json['path_id'] as int?;
    title = json['title'] as String?;
    description = json['description'] as String?;
    order = json['order'] as int?;
    status = json['status'] as String?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['path_id'] = pathId;
    map['title'] = title;
    map['description'] = description;
    map['order'] = order;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
