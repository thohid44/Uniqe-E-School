import 'package:e_unique_school/controller/ebook_controller.dart';
import 'package:e_unique_school/view/ebook/buyebook.dart';
import 'package:e_unique_school/view/ebook/BookCartPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EbookDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sendBuyBook = Get.put(EbookController());
    var recieveEbook = Get.arguments;
    var price = recieveEbook[0][0];
    var name = recieveEbook[0][1];
    print(recieveEbook);
    return Scaffold(
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
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 35,
                  color: Colors.white,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  price,
                  style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                  child: Text(
                name.toString(),
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 34),
                child: ElevatedButton.icon(
                    onPressed: () {
//Get.to(BookCartPage(), arguments: recieveEbook);
                    },
                    icon: const Icon(Icons.shopping_cart_checkout_outlined),
                    label: const Text(
                      "Buy Now",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )),
              )
            ],
          ),
        ));
    ;
  }
}
