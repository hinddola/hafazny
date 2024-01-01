import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hafazny/model/QuraanModel.dart';
import 'package:hafazny/screens/quran_screen/controller/quraan_controller.dart';

import '../../components/customed_back_arrow.dart';
import '../../const/style.dart';

class QuraanScreen extends StatelessWidget {
  QuraanScreen({Key? key}) : super(key: key);

  final quranController = Get.put(QuraanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90.w,
        iconTheme: const IconThemeData(color: ColorStyle.blackColor),
        centerTitle: true,
        title: Text(
          'القرآن الكريم',
          style: TextStyleHelper.subtitle19,
        ),
        backgroundColor: ColorStyle.whiteColor,
        elevation: 0.0,
        leading: const CustomArrowBack(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              FutureBuilder(
                future: quranController.getQuraan(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    QuraanModel data = snapshot.data!;
                    return GetBuilder<QuraanController>(
                        builder: (quranController){
                          return Center(
                            child: CarouselSlider.builder(
                              itemCount: data.data!.surahs?.length,
                              itemBuilder: (context, index, realIndex) {
                                Surahs surah = data.data!.surahs![index];
                                return Container(
                                  child: Text(
                                    '${data.data!.surahs!}'
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                autoPlay: false,
                                height: 220.h,
                                viewportFraction: 0.9,
                                onPageChanged: (index, reason) {
                                  print(index);
                                },
                              ),
                            ),
                          );
                        }
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error loading data: ${snapshot.error}'),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SurahWidget extends StatelessWidget {
  final Surahs surah;

  SurahWidget({required this.surah});

  @override
  Widget build(BuildContext context) {
    // Customize this widget based on your UI requirements
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Number: ${surah.number}'),
          Text('Name: ${surah.name}'),
          // Add more fields as needed
        ],
      ),
    );
  }
}
