import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../components/customed_button.dart';
import '../../components/customed_form_field.dart';
import '../../const/style.dart';
import '../../model/CertificateModel.dart';
import '../../model/EduLevelModel.dart';
import 'controller/controller.dart';

class TeacherCompleteDataSecScreen extends StatelessWidget {
  TeacherCompleteDataSecScreen({Key? key}) : super(key: key);

  final controller = Get.put(TeacherSuccessResController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'استكمال بيانات المعلم',
                  style: TextStyleHelper.subtitle19,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ',
                  style: TextStyleHelper.body15
                      .copyWith(color: ColorStyle.lightNavyColor),
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomFormField(
                  isLabeled: true,
                  labelText: 'نبذه مختصرة',
                  hintText: 'قم بكتابة نبذة مختصرة عنك',
                  keyboardType: TextInputType.text,
                  controller: controller.shortInfocontroller,
                ),
                SizedBox(
                  height: 10.h,
                ),


                // DropdownButtonFormField(
                //   // value: controller.selectedEduLevel.value,
                //     items: Text(controller.eduLevelList.value[0] as String),
                //   // items: controller.eduLevelList.value.map((eduLevel) {
                //   //   return DropdownMenuItem(
                //   //     value: eduLevel,
                //   //     child: Text(eduLevel.educationLevels.), // Assuming 'name' is the property in EduLevelModel
                //   //   );
                //   // }).toList(),
                //   onChanged: (newValue) {
                //     // if (newValue != null) {
                //     //   controller.updateSelectedEduLevel(newValue.id); // Assuming 'id' is the property in EduLevelModel
                //     // }
                //   },
                //   decoration: InputDecoration(
                //     labelText: 'اختر مستوى التعليم',
                //     border: OutlineInputBorder(),
                //   ),
                // ),



                // MultiSelectFormField<CertificateModel>(
                //   autovalidate: false,
                //   chipBackGroundColor: Colors.blue,
                //   chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                //   dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                //   checkBoxActiveColor: Colors.blue,
                //   checkBoxCheckColor: Colors.white,
                //   dialogShapeBorder: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.all(Radius.circular(12.0)),
                //   ),
                //   title: Text('Select Certificates'),
                //   dataSource: controller.certificateList
                //       .map((certificate) =>
                //       MultiSelectItem<CertificateModel>(
                //           certificate, certificate.name))
                //       .toList(),
                //   textField: 'name',
                //   valueField: 'name',
                //   onSaved: (value) {
                //     // Save the selected certificates
                //     controller.selectedCertificates.assignAll(value ?? []);
                //   },
                // ),
                Spacer(),
                CustomButton(
                  onPressed: () {
                    //Get.to(TeacherCompleteDataFirstScreen());
                  },
                  text: 'التالى',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
