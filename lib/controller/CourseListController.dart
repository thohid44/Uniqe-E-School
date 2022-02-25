import 'dart:convert';

import 'package:e_unique_school/auth/CustomService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CourseListController extends GetxController {
  String userid = '';
  String username = '';
  String pric = '';
  String courseid = '';
  String transactionmobile_no = '';
  String transactionid = '';

  var isCourseListLoadingCompleted = false.obs;
  var coursebaseUrl = "uniqueeschool.com";
  List<CourseListModel> courseList = <CourseListModel>[].obs;

  var courseClient = http.Client();

  onInit() {
    courseList;
    super.onInit();
  }

  dispose() {
    super.dispose();
  }

  Future<List<CourseListModel>> fetchCourseList(id) async {
    var response =
        await courseClient.get(Uri.https(coursebaseUrl, 'course/$id'));
    var courseListData = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in courseListData) {
        CourseListModel course_list = CourseListModel(
            id: i['id'].toString(),
            course_name: i['course_name'].toString(),
            course_desc: i['course_desc'].toString(),
            course_duration: i['course_duration'].toString(),
            original_price: i['original_price'].toString(),
            selling_price: i['selling_price'].toString(),
            image: i['image'].toString());

        courseList.add(course_list);
      }
      isCourseListLoadingCompleted = true.obs;
      return courseList;
    } else {
      return courseList;
    }
  }

  cartCourse(String uid, String uname, String prices, String cid, String mobile,
      String txnId) async {
    userid = uid;
    username = uname;
    pric = prices;
    courseid = cid;
    transactionmobile_no = mobile;
    transactionid = txnId;

    Map<String, String> courseData = {
      CustomWebServices.userId: userid,
      CustomWebServices.userName: username,
      CustomWebServices.cPrice: pric,
      CustomWebServices.courseId: courseid,
      CustomWebServices.mobile: transactionmobile_no,
      CustomWebServices.transactionId: transactionid
    };
    var dataToSend = json.encode(courseData);
    var response = await http.post(
        Uri.parse(CustomWebServices.course_order_api_url),
        body: dataToSend);

    Get.snackbar(
      "Buy Course",
      "Success",
      duration: Duration(seconds: 2),
      backgroundColor: Colors.black,
      colorText: Colors.white,
    );
  }
}

class CourseListModel {
  String? id;
  String? course_name;
  String? course_desc;
  String? course_duration;
  String? original_price;
  String? selling_price;
  String? image;

  CourseListModel({
    required this.id,
    required this.course_name,
    required this.course_desc,
    required this.course_duration,
    required this.original_price,
    required this.selling_price,
    required this.image,
  });
}

class CourseCartPageModel {
  String? user_id;
  String? user_name;
  // String? price;
  // String? course_id;
  String? transaction_mobile_no;
  String? transaction_id;

  CourseCartPageModel({
    required this.user_id,
    required this.user_name,
    // required this.price,
    //required this.course_id,
    required this.transaction_mobile_no,
    required this.transaction_id,
  });
}
