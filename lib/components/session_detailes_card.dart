import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hafazny/screens/session_screen/controller/session_controller.dart';

import '../const/style.dart';

class SessionDetailsCard extends StatelessWidget {
   SessionDetailsCard({
    super.key,
    required this.content,
  });

  final controller = Get.put(SessionController());

  final List<Map<String, dynamic>> content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Column(
        children: List.generate(
          content.length,
              (index) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  content[index]['subTitle'],
                  style: TextStyleHelper.body15.copyWith(
                      color: ColorStyle.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  content[index]['title'],
                  style: TextStyleHelper.body15
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
