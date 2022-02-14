import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_unique_school/controller/ebook_controller.dart';

class ConfirmBuy extends StatelessWidget {
  final TextEditingController number = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    final EbookController obj = Get.find();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(title: const Text("Finish")),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: number,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        obj.addProduct([data, number.text]);
                        obj.recieveBook(data['id'], data['name'], data['img'],
                            data['price'], number.text);
                      },
                      child: Text("Submit"))
                ],
              )),
        ),
      ),
    );
  }
}
