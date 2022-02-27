import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_unique_school/controller/ebook_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookCartPage extends StatefulWidget {
  const BookCartPage({Key? key}) : super(key: key);

  @override
  _BookCartPageState createState() => _BookCartPageState();
}

class _BookCartPageState extends State<BookCartPage> {
  final GlobalKey<FormState> _key = GlobalKey();

  TextEditingController username = TextEditingController();

  TextEditingController mobile = TextEditingController();
  TextEditingController txtId = TextEditingController();
  String userId = '';

  Future<void> loadUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var mapData = json.decode(preferences.getString("sharedata")!);
    print("Student Id $mapData");

    setState(() {
      userId = mapData['studentId'].toString();
    });
  }

  void initState() {
    loadUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;

    var id = data['id'];
    var price = data['price'];
    print(id);
    print(price);

    final EbookController bookController = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text("Book Buy Page")),
      body: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  TextField(
                    controller: username,
                    decoration: const InputDecoration(
                        labelText: "User Name",
                        hintText: "Enter Your User Name",
                        hintStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(171, 255, 255, 255),
                        borderRadius: BorderRadius.circular(30)),
                    child: TextField(
                      controller: mobile,
                      decoration: const InputDecoration(
                        labelText: "Bkash Payment Number",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 55,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: TextField(
                      controller: txtId,
                      decoration: const InputDecoration(
                          labelText: "Bkash Transaction Number",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width * .2,
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(30)),
                    child: ElevatedButton(
                        onPressed: () {
                          bookController.cartBook(
                              userId.toString(),
                              username.text,
                              price,
                              id,
                              mobile.text,
                              txtId.text);
                        },
                        child: const Text("Submit",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold))),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
