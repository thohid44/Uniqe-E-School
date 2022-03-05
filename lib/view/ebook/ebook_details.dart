import 'dart:convert';

import 'package:e_unique_school/controller/ebook_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EbookDetails extends StatefulWidget {
  @override
  State<EbookDetails> createState() => _EbookDetailsState();
}

class _EbookDetailsState extends State<EbookDetails> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _keys = GlobalKey();

    TextEditingController _uname = TextEditingController();

    TextEditingController _mobile = TextEditingController();
    TextEditingController txnid = TextEditingController();
    String _userId = '';
    Future<void> loadUserData() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var mapData = json.decode(preferences.getString("sharedata")!);
      print("Student Id $mapData");

      setState(() {
        _userId = mapData['studentId'].toString();
      });
    }

    void initState() {
      loadUserData();
      super.initState();
    }

    var sendBuyBook = Get.put(EbookController());
    var recieveEbook = Get.arguments;
    var bookId = recieveEbook[0];
    var price = recieveEbook[3];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "E Book Collection",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        actions: [],
      ),
      body: Form(
        key: _keys,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: _uname,
                  decoration: InputDecoration(
                      labelText: "User Name",
                      hintText: "Enter Your User Name",
                      hintStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(171, 255, 255, 255),
                      borderRadius: BorderRadius.circular(30)),
                  child: TextField(
                    controller: _mobile,
                    decoration: InputDecoration(
                      labelText: "Bkash Payment Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 55,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: txnid,
                    decoration: InputDecoration(
                        labelText: "Bkash Transaction Number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                const SizedBox(
                  height: 29,
                ),
                InkWell(
                  onTap: () {
                    sendBuyBook.cartBook(_userId, _uname.text, price, bookId,
                        _mobile.text, txnid.text);
                  },
                  child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * .6,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                        child: Text("Confirm",
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
