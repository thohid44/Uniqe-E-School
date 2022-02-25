import 'dart:convert';

import 'package:e_unique_school/model/Course_Purchase_Model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PurchaseCourseController extends GetxController {
  List<CoursePurchaseModel> purchase_courses_list = <CoursePurchaseModel>[].obs;

  var isCourseListLoadingCompleted = false.obs;
  var coursebaseUrl = "uniqueeschool.com";
  var purchase_Client = http.Client();

  void onInit() {
    purchase_courses_list;
    super.onInit();
  }

  void dispose() {
    purchase_courses_list;

    super.dispose();
  }

  Future<List<CoursePurchaseModel>> fetchPurchaseCourse(id) async {
    var response = await purchase_Client
        .get(Uri.https(coursebaseUrl, "purchase_course/$id"));
    //  print(response);
    if (response.statusCode == 200) {
      var resData = jsonDecode(response.body.toString());
//print(resData);
      for (Map i in resData) {
        CoursePurchaseModel dataList = CoursePurchaseModel(
          course_id: i['course_id'],
          price: i["price"],
          image: i["image"],
          course_name: i["course_name"],
        );
        purchase_courses_list.add(dataList);
      }
      isCourseListLoadingCompleted.value = true;
      return purchase_courses_list;
    }
    return purchase_courses_list;
  }
}
