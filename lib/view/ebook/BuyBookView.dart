import 'package:e_unique_school/controller/User_Ebook_Controller.dart';
import 'package:e_unique_school/view/ebook/ReadBook.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyBookView extends StatelessWidget {
  BuyBookView({Key? key}) : super(key: key);
  final UserEbookController bookController = Get.put(UserEbookController());
  @override
  Widget build(BuildContext context) {
    var stdId = Get.arguments;
    bookController.fetchBuyBookList(stdId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF009688),
        title: const Text("All E Books"),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: bookController.ebookList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(ReadBook(),
                      arguments: bookController.ebookList[index].orderReadBook);
                  // print(
                  //     bookController.ebookList[index].orderReadBook.toString());
                },
                child: Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      bookController.ebookList[index].title,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    )),
              );
            }),
      ),
    );
  }
}
