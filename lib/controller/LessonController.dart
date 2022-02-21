import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class LessonController extends GetxController {
  var isLessonLoadingComplete = false.obs;
  var clientLesson = http.Client();
  var lesson_api_url = "app.chadahatti.org";
  List<LessonModel> lessons = <LessonModel>[].obs;

  void onInit() {
    lessons.clear();
    super.onInit();
  }

  Future<List<LessonModel>> fetchLesson(id) async {
    var responseLesson =
        await clientLesson.get(Uri.https(lesson_api_url, "lesson/$id"));
    var data = jsonDecode(responseLesson.body);

    if (responseLesson.statusCode == 200) {
      for (Map i in data) {
        LessonModel datalist = LessonModel(
            id: i['id'], title: i['title'], videoUrl: i['video_url']);
        lessons.add(datalist);
      }

      return lessons;
    }
    return lessons;
  }
}

// List<LessonModel> lessonModelFromJson(String str) => List<LessonModel>.from(
//     json.decode(str).map((x) => LessonModel.fromJson(x)));

// String lessonModelToJson(List<LessonModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LessonModel {
  LessonModel({
    required this.id,
    required this.title,
    required this.videoUrl,
  });

  String id;
  String title;
  String videoUrl;

  // factory LessonModel.fromJson(Map<String, dynamic> json) => LessonModel(
  //       id: json["id"],
  //       title: json["title"],
  //       videoUrl: json["video_url"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "title": title,
  //       "video_url": videoUrl,
  //     };
}
