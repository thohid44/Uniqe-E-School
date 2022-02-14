import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CourseListController extends GetxController {
  var isCourseListLoadingCompleted = false.obs;
  var coursebaseUrl = "app.chadahatti.org";
  List<CourseListModel> courseList = <CourseListModel>[].obs;
  var courseClient = http.Client();

  onInit() {
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
