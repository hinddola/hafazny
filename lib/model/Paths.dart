import 'PathItems.dart';

class Paths {
  int? id;
  String? title;
  String? description;
  int? order;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<PathItems>? pathItems;

  Paths({
    this.id,
    this.title,
    this.description,
    this.order,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.pathItems,
  });

  Paths.fromJson(dynamic json) {
    id = json['id'] as int?;
    title = json['title'] as String?;
    description = json['description'] as String?;
    order = json['order'] as int?;
    status = json['status'] as String?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;

    if (json['path_items'] != null) {
      pathItems = [];
      if (json['path_items'] is List) {
        // Check if 'path_items' is a List
        json['path_items'].forEach((v) {
          pathItems!.add(PathItems.fromJson(v));
        });
      }
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['order'] = order;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (pathItems != null) {
      map['path_items'] = pathItems!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
