// To parse this JSON data, do
//
//     final courseTypeM = courseTypeMFromJson(jsonString);

import 'dart:convert';

List<CourseTypeM> courseTypeMFromJson(String str) => List<CourseTypeM>.from(
    json.decode(str).map((x) => CourseTypeM.fromJson(x)));

String courseTypeMToJson(List<CourseTypeM> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseTypeM {
  CourseTypeM({
    required this.id,
    required this.courseType,
  });

  String id;
  String courseType;

  factory CourseTypeM.fromJson(Map<String, dynamic> json) => CourseTypeM(
        id: json["id"],
        courseType: json["course_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course_type": courseType,
      };
}
