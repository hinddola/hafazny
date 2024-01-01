// class SliderModel {
//   String? status;
//   Data? data;
//
//   SliderModel({this.status, this.data});
//
//   SliderModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   SlidderData? slidderData;
//
//   Data({this.slidderData});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     slidderData = json['slidderImages'] != null
//         ? SlidderData.fromJson(json['slidderImages'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (slidderData != null) {
//       data['slidderImages'] = slidderData!.toJson();
//     }
//     return data;
//   }
// }
//
// class SlidderData {
//   List<SlidderImages>? slidderImages;
//   double? appCommission;
//   int? sessionPrice;
//
//   SlidderData({this.slidderImages, this.appCommission, this.sessionPrice});
//
//   SlidderData.fromJson(Map<String, dynamic> json) {
//     if (json['slidderImages'] != null) {
//       slidderImages = <SlidderImages>[];
//       json['slidderImages'].forEach((v) {
//         slidderImages!.add(SlidderImages.fromJson(v));
//       });
//     }
//     appCommission = json['appCommission'];
//     sessionPrice = json['sessionPrice'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (slidderImages != null) {
//       data['slidderImages'] = slidderImages!.map((v) => v.toJson()).toList();
//     }
//     data['appCommission'] = appCommission;
//     data['sessionPrice'] = sessionPrice;
//     return data;
//   }
// }
//
// class SlidderImages {
//   String? imageName;
//   int? iId;
//
//   SlidderImages({this.imageName, this.iId});
//
//   SlidderImages.fromJson(Map<String, dynamic> json) {
//     imageName = json['imageName'];
//     iId = json['_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['imageName'] = imageName;
//     data['_id'] = iId;
//     return data;
//   }
// }
