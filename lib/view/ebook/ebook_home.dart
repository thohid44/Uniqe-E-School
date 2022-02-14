import 'package:e_unique_school/controller/ebook_controller.dart';
import 'package:e_unique_school/view/ebook/buyebook.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ebook_details.dart';

class EbookHome extends StatelessWidget {
  const EbookHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ebookController = Get.put(EbookController());
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.amber,
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.person_add_alt_1_outlined),
                title: const Text("User Name"),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "E-Book Collection",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(BuyBookList());
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 35,
                  color: Colors.white,
                ))
          ],
        ),
        body: Obx(() => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 170,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: ebookController.ebookList.length,
              itemBuilder: (_, index) {
                return Container(
                  color: Colors.amber,
                  padding: EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          height: 120,
                          child: Image.network(
                            ebookController.ebookList[index]['img'],
                            height: 110,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Price ${ebookController.ebookList[index]['price']}.TK',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Get.to(
                                    EbookDetails(),
                                    arguments: ebookController.ebookList[index],
                                    // arguments: {
                                    //   "name": ebookController.ebookList[index]
                                    //       ['name'],
                                    //   "img": ebookController.ebookList[index]
                                    //       ['img'],
                                    //   "des": ebookController.ebookList[index]
                                    //       ['des'],
                                    //   "price": ebookController.ebookList[index]
                                    //       ['price'],
                                    // },
                                  );
                                },
                                child: const Text(
                                  "Buy",
                                  style: TextStyle(fontSize: 20),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            )));
  }
}
