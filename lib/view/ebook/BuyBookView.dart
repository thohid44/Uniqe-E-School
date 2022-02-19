import 'package:e_unique_school/controller/User_Ebook_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyBookView extends StatelessWidget {
  BuyBookView({Key? key}) : super(key: key);
  final UserEbookController bookController = Get.put(UserEbookController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All video Course"),
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: bookController.ebookList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  bookController.ebookList[index].title,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              );
            }),
      ),
    );
  }
}
