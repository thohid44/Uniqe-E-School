// To parse this JSON data, do
//
//     final coursePurchaseModel = coursePurchaseModelFromJson(jsonString);

import 'dart:convert';

class CoursePurchaseModel {
  CoursePurchaseModel({
    required this.course_id,
    required this.price,
    required this.image,
    required this.course_name,
  });

  String course_id;
  String price;
  String image;
  String course_name;
}
