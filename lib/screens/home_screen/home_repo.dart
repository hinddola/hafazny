import 'dart:developer';

import 'package:get/get_connect/http/src/response/response.dart';

import '../../model/slider_model.dart';
// import '../../network/end_points.dart';
// import '../../network/network.dart';

// class SliderRepo {
//
//   Future<List<SlidderImages>> getHomeSlider() async {
//     final res = await Network.instance!
//         .get(url: ApiNames.imageSliderEndPoint, withToken: false);
//     log('home slider repo data: ${res.data.toString()}');
//     log('home slider repo datatype: ${res.data.runtimeType}');
//     if (res.statusCode! >= 200 && res.statusCode! < 300) {
//       log('repo status code:${res.statusCode}');
//       if (res.data.isNotEmpty) {
//         return SliderModel.fromJson(res.data).data!.slidderData!.slidderImages!;
//       } else {
//         log('home slider is empty');
//         return [];
//       }
//     } else {
//       log('get home slider repo error:${res.data}');
//       throw Exception('Failed to load data!');
//     }
//
//   }
// }