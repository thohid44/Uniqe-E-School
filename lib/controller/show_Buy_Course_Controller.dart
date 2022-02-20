// import 'dart:convert';

// import 'package:e_unique_school/model/Course_Purchase_Model.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class ShowBuyCourseController extends GetxController {
//   List<CoursePurchaseModel> purchase_courses_list = <CoursePurchaseModel>[].obs;

//   var isCourseListLoadingCompleted = false.obs;
//   var coursebaseUrl = "app.chadahatti.org";
//   var purchase_Client = http.Client();
//   var path = "purchase_course/2";
//   Future<List<CoursePurchaseModel>> fetchPurchaseCourse() async {
//     var response = await purchase_Client.get(Uri.https(coursebaseUrl, path));

//     if (response.statusCode == 200) {
//       var resData = jsonDecode(response.body);
//       for (Map i in resData) {
//         CoursePurchaseModel dataList = CoursePurchaseModel(
//             bookId: i['bookId'],
//             price: i["price"],
//             image: i["image"],
//             orderReadBook: i["orderReadBook"],
//             title: i['title']);

//         purchase_courses_list.add(dataList);
//       }
//       isCourseListLoadingCompleted.value = true;
//       return purchase_courses_list;
//     }
//     return purchase_courses_list;
//   }
// }
