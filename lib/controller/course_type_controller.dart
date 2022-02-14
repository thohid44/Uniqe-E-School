import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CourseTypeController extends GetxController {
  List<CourseTypeModel> courseTypeList = <CourseTypeModel>[].obs;
  var isDataLoadingCompleted = false.obs;

  @override
  void onInit() {
    // TODO: implement
    fetchCourseType();
    super.onInit();
  }

  @override
  void dispose() {
    fetchCourseType();
    super.dispose();
  }

  var clients = http.Client();
  Future<List<CourseTypeModel>> fetchCourseType() async {
    var respon = await clients
        .get(Uri.parse("http://app.chadahatti.org/course_types/1"));
    var data = jsonDecode(respon.body.toString());

    if (respon.statusCode == 200) {
      for (Map i in data) {
        CourseTypeModel courstype = CourseTypeModel(
          id: i['id'].toString(),
          coursetype: i['course_type'].toString(),
        );

        courseTypeList.add(courstype);
      }
      //     isDataLoadingCompleted = true.obs;

      return courseTypeList;
    } else {
      return courseTypeList;
    }
  }
}

class CourseTypeModel {
  String id;
  String coursetype;
  CourseTypeModel({
    required this.id,
    required this.coursetype,
  });
}
