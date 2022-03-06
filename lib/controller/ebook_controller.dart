import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../auth/CustomService.dart';

class EbookController extends GetxController {
  List<AllBookModel> allEbookList = <AllBookModel>[].obs;
  var bookLoadIsComplete = false.obs;

  String userid = '';
  String username = '';
  String price = '';
  String bookId = '';
  String transactionmobile_no = '';
  String transactionid = '';

  // Initaization

  void onInit() {
    fetchAllEbooks();
    super.onInit();
  }

  var bookClient = http.Client();
// Fetch All Books From Api

  Future<List<AllBookModel>> fetchAllEbooks() async {
    var response =
        await bookClient.get(Uri.parse(CustomWebServices.all_book_api_url));

    var jsonBookString = jsonDecode(response.body.toString());
//print(jsonBookString);

    if (response.statusCode == 200) {
      for (var i in jsonBookString) {
        AllBookModel bookData = AllBookModel(
            id: i['id'],
            title: i['title'],
            price: i['price'],
            free_read_book: i['free_read_book'],
            order_read_book: i['order_read_book'],
            image: i['image']);
        allEbookList.add(bookData);
        print(allEbookList);
      }

      return allEbookList;
    }

    return allEbookList;
  }

  // Recieve Book data

  cartBook(String uid, String uname, String prices, String bid, String mobile,
      String txnId) async {
    userid = uid;
    username = uname;
    price = prices;
    bookId = bid;
    transactionmobile_no = mobile;
    transactionid = txnId;

    Map<String, String> bookData = {
      CustomWebServices.userId: userid,
      CustomWebServices.userName: username,
      CustomWebServices.cPrice: price,
      CustomWebServices.courseId: bookId,
      CustomWebServices.mobile: transactionmobile_no,
      CustomWebServices.transactionId: transactionid
    };
    var dataToSend = json.encode(bookData);
    var response = await http.post(
        Uri.parse(CustomWebServices.course_order_api_url),
        body: dataToSend);

    Get.snackbar(
      "Book",
      "Successfully Buyed ",
      duration: Duration(seconds: 2),
      backgroundColor: Colors.black,
      colorText: Colors.white,
    );
  }
}

class AllBookModel {
  final String id;
  final String title;

  final String price;
  final String free_read_book;
  final String order_read_book;
  final String image;

  AllBookModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.free_read_book,
      required this.order_read_book,
      required this.image});
}

class BookCartPageModel {
  String? user_id;
  String? user_name;
  String? price;
  String? book_id;
  String? transaction_mobile_no;
  String? transaction_id;

  BookCartPageModel({
    required this.user_id,
    required this.user_name,
    required this.price,
    required this.book_id,
    required this.transaction_mobile_no,
    required this.transaction_id,
  });
}
