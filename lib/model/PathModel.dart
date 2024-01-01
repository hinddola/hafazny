import 'Paths.dart';

class PathModel {
  List<Paths>? paths;

  PathModel({
    this.paths,
  });

  PathModel.fromJson(dynamic json) {
    print('check json');
    paths = [];

    // Check if 'paths' is not null and is a List
    if (json['paths'] != null && json['paths'] is List) {
      // Iterate over the 'paths' array
      json['paths'].forEach((v) {
        print('path fetch $v');
        // Add a check to ensure 'v' is a Map before attempting to create a Paths object
        if (v is Map<String, dynamic>) {
          paths!.add(Paths.fromJson(v));
        }
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (paths != null) {
      map['paths'] = paths!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
