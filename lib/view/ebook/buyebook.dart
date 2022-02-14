import 'package:e_unique_school/controller/ebook_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyBookList extends StatelessWidget {
  const BuyBookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EbookController buyedEbook = Get.find();
    print(buyedEbook.recieveBookList.length);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart List"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: buyedEbook.recieveBookList.length,
            itemBuilder: (_, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 70,
                color: Colors.amber,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(buyedEbook.recieveBookList[index].name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(
                        "Pay Id: .  ${buyedEbook.recieveBookList[index].payment}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("Tk.  ${buyedEbook.recieveBookList[index].price}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
