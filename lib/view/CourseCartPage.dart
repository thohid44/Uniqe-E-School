import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/CourseListController.dart';

class CourseCartPage extends StatefulWidget {
  @override
  State<CourseCartPage> createState() => _CourseCartPageState();
}

class _CourseCartPageState extends State<CourseCartPage> {
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

    var id = data[0];
    var price = data[1];
    print(id);
    print(price);

    final CourseListController courseController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Course Buy Page"),
        centerTitle: true,
        backgroundColor: Color(0xFF009688),
      ),
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
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: "User Name",
                      hintText: "Enter Your User Name",
                      hintStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
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
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: "Bkash Payment Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
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
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        labelText: "Bkash Transaction Number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                const SizedBox(
                  height: 29,
                ),
                InkWell(
                  onTap: () {
                    courseController.cartCourse(userId.toString(),
                        username.text, price, id, mobile.text, txtId.text);
                  },
                  child: Container(
                      height: 55,
                      width: 280,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
