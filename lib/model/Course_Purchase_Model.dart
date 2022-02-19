// To parse this JSON data, do
//
//     final coursePurchaseModel = coursePurchaseModelFromJson(jsonString);

import 'dart:convert';

List<CoursePurchaseModel> coursePurchaseModelFromJson(String str) =>
    List<CoursePurchaseModel>.from(
        json.decode(str).map((x) => CoursePurchaseModel.fromJson(x)));

String coursePurchaseModelToJson(List<CoursePurchaseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoursePurchaseModel {
  CoursePurchaseModel({
    required this.bookId,
    required this.price,
    required this.created,
    required this.image,
    required this.orderReadBook,
    required this.title,
  });

  String bookId;
  String price;
  DateTime created;
  String image;
  String orderReadBook;
  String title;

  factory CoursePurchaseModel.fromJson(Map<String, dynamic> json) =>
      CoursePurchaseModel(
        bookId: json["book_id"],
        price: json["price"],
        created: DateTime.parse(json["created"]),
        image: json["image"],
        orderReadBook: json["order_read_book"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "book_id": bookId,
        "price": price,
        "created": created.toIso8601String(),
        "image": image,
        "order_read_book": orderReadBook,
        "title": title,
      };
}
