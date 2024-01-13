class HomeImageSlider {
  HomeImageSlider({
      this.homeSliders,});

  HomeImageSlider.fromJson(dynamic json) {
    if (json['home_sliders'] != null) {
      homeSliders = [];
      json['home_sliders'].forEach((v) {
        homeSliders?.add(HomeSliders.fromJson(v));
      });
    }
  }
  List<HomeSliders>? homeSliders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (homeSliders != null) {
      map['home_sliders'] = homeSliders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class HomeSliders {
  HomeSliders({
      this.id, 
      this.image, 
      this.content, 
      this.status, 
      this.link, 
      this.createdAt, 
      this.updatedAt,});

  HomeSliders.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    content = json['content'];
    status = json['status'];
    link = json['link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? image;
  String? content;
  String? status;
  String? link;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['content'] = content;
    map['status'] = status;
    map['link'] = link;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}