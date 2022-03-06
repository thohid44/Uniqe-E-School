import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class UserEbookController extends GetxController {
  var isEbookComplete = false.obs;
  var eBookbuyUrl = "uniqueeschool.com";
  List<UserEbookModel> ebookList = <UserEbookModel>[].obs;

  var buyCourse = http.Client();
  DateTime now = DateTime.now();

  onInit() {
    super.onInit();
  }

  dispose() {
    super.dispose();
  }

  Future<List<UserEbookModel>> fetchBuyBookList(stdId) async {
    var response =
        await buyCourse.get(Uri.https(eBookbuyUrl, 'purchase_book/$stdId'));
    var courseListData = jsonDecode(response.body.toString());
//print(response.body);
//print(courseListData);

    if (response.statusCode == 200) {
      for (Map i in courseListData) {
        UserEbookModel ebook = UserEbookModel(
            bookId: i['book_id'],
            price: i['price'],
            image: i['image'],
            orderReadBook: i['order_read_book'],
            title: i['title']);

        ebookList.add(ebook);
        //print(buyCourseList.length);
      }
      print(ebookList);
      return ebookList;
    } else {
      return ebookList;
    }
  }
}

// To parse this JSON data, do
//
//     final userEbookModel = userEbookModelFromJson(jsonString);

// List<UserEbookModel> userEbookModelFromJson(String str) => List<UserEbookModel>.from(json.decode(str).map((x) => UserEbookModel.fromJson(x)));

// String userEbookModelToJson(List<UserEbookModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserEbookModel {
  UserEbookModel({
    required this.bookId,
    required this.price,
    required this.image,
    required this.orderReadBook,
    required this.title,
  });

  String bookId;
  String price;
  String image;
  String orderReadBook;
  String title;

  // factory UserEbookModel.fromJson(Map<String, dynamic> json) => UserEbookModel(
  //     bookId: json["book_id"],
  //     price: json["price"],
  //     created: DateTime.parse(json["created"]),
  //     image: json["image"],
  //     orderReadBook: json["order_read_book"],
  //     title: json["title"],
  // );

  // Map<String, dynamic> toJson() => {
  //     "book_id": bookId,
  //     "price": price,
  //     "created": created.toIso8601String(),
  //     "image": image,
  //     "order_read_book": orderReadBook,
  //     "title": title,
  // };
}
