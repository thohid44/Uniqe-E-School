import 'package:e_unique_school/controller/ebook_controller.dart';
import 'package:e_unique_school/view/ebook/BookCartPage.dart';
import 'package:e_unique_school/widget/botto_navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EbookHome extends StatelessWidget {
  const EbookHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ebookController = Get.put(EbookController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "E-Book Collection",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigator(),
        body: Obx(() => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 240,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: ebookController.allEbookList.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      var id =
                          ebookController.allEbookList[index].id.toString();
                      var price =
                          ebookController.allEbookList[index].price.toString();

                      Get.to(BookCartPage(), arguments: [
                        id,
                        price,
                      ]);
                    },
                    child: Container(
                      color: Colors.amber,
                      padding: EdgeInsets.only(top: 0),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              height: 100,
                              width: 200,
                              child: Image.asset(
                                "assets/book.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Price ${ebookController.allEbookList[index].price}.TK',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )));
  }
}
