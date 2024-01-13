FutureBuilder(
future: controller.getCertifications(),
builder: (context, snapshot) {
if (snapshot.connectionState ==
ConnectionState.waiting) {
return Center(child: CircularProgressIndicator());
} else if (snapshot.hasError) {
return Center(child: Text('Error loading data'));
} else {
return 
}
}),



Future getSubscriptions() async {
try{
final response = await http.get(
Uri.parse(apiUrl.subscriptions) ,
headers: {
'Content-Type': 'application/json',
},
);
if (response.statusCode == 200){
subscriptions =  SubscriptionModel.fromJson(jsonDecode(response.body));
//print(subscriptions.subscription?.subscriptionDetail?.totalHours);

      }
    }catch(e){
      print(e);
    }
}








return Center(child: Container(
height: 50.h,
width: 50.w,
child: CircularProgressIndicator(
color: ColorStyle.primaryColor
)));



Get.snackbar(
'تم الحجز بنجاح',
'سيتم تنبيهك في موعد الحصة',
snackPosition: SnackPosition.TOP,
backgroundColor: ColorStyle.primaryColor,
colorText: Colors.white,
);



Get.snackbar(
'خطأ',
'يجب تحديد وقت مناسب لحجز الجلسة!',
snackPosition: SnackPosition.TOP,
backgroundColor: Colors.red,
colorText: Colors.white,
);