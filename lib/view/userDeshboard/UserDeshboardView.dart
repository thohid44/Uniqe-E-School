import 'dart:convert';

import 'package:e_unique_school/view/Purchase_CourseView.dart';
import 'package:e_unique_school/view/ebook/BuyBookView.dart';
import 'package:e_unique_school/widget/botto_navigator.dart';
import 'package:e_unique_school/widget/user_desh_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDeshBoardView extends StatefulWidget {
  @override
  State<UserDeshBoardView> createState() => _UserDeshBoardViewState();
}

class _UserDeshBoardViewState extends State<UserDeshBoardView> {
  var studentId;

  Future<void> loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var mapData = json.decode(preferences.getString("sharedata")!);
    print("Student Id $mapData");

    setState(() {
      studentId = mapData['studentId'].toString();
    });
  }

  void initState() {
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    print("Student $studentId");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: const Text("User Deshboard"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigator(),
      body: Container(
//padding: const EdgeInsets.all(8.0),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
          children: [
            GestureDetector(
              onTap: () {
                Get.to(
                  PurchaseCourseView(),
                  arguments: studentId,
                );
              },
              child: UserDeshWidget(
                title: "Your Course",
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(BuyBookView(), arguments: studentId);
              },
              child: UserDeshWidget(title: "Your EBook "),
            ),
          ],
        ),
      ),
    );
  }
}
