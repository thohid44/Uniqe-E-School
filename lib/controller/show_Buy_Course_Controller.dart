import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class ShowBuyCourseController extends GetxController {
  var isCourseListLoadingCompleted = false.obs;
  var coursebuyUrl = "app.chadahatti.org";
  List<ShowBuyCourseModel> buyCourseList = <ShowBuyCourseModel>[].obs;

  var buyCourse = http.Client();
  DateTime now = DateTime.now();

  onInit() {
    buyCourseList;
    fetchCourseList();
    super.onInit();
  }

  dispose() {
    super.dispose();
  }

  Future<List<ShowBuyCourseModel>> fetchCourseList() async {
    var response =
        await buyCourse.get(Uri.https(coursebuyUrl, 'purchase_course/2'));
    var courseListData = jsonDecode(response.body.toString());
//print(response.body);
//print(courseListData);

    if (response.statusCode == 200) {
      for (Map i in courseListData) {
        ShowBuyCourseModel dataList = ShowBuyCourseModel(
            courseId: i['course_id'].toString(),
            price: i['price'].toString(),
            image: i['image'].toString(),
            courseName: i['course_name'].toString());

//print(dataList.courseId);

        buyCourseList.add(dataList);
        //print(buyCourseList.length);
      }
      print(buyCourseList);
      return buyCourseList;
    } else {
      return buyCourseList;
    }
  }
}

// To parse this JSON data, do
//
//     final showBuyCourseModel = showBuyCourseModelFromJson(jsonString);

// List<ShowBuyCourseModel> showBuyCourseModelFromJson(String str) =>
//     List<ShowBuyCourseModel>.from(
//         json.decode(str).map((x) => ShowBuyCourseModel.fromJson(x)));

// String showBuyCourseModelToJson(List<ShowBuyCourseModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShowBuyCourseModel {
  ShowBuyCourseModel({
    required this.courseId,
    required this.price,
    required this.image,
    required this.courseName,
  });

  String courseId;
  String price;
  String image;
  String courseName;

  factory ShowBuyCourseModel.fromJson(Map<String, dynamic> json) =>
      ShowBuyCourseModel(
        courseId: json["course_id"],
        price: json["price"],
        image: json["image"],
        courseName: json["course_name"],
      );

  Map<String, dynamic> toJson() => {
        "course_id": courseId,
        "price": price,
        "image": image,
        "course_name": courseName,
      };
}
