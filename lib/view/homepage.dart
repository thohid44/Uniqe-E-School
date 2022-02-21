import 'package:e_unique_school/auth/UserDeshBoard.dart';
import 'package:e_unique_school/controller/course_type_controller.dart';
import 'package:e_unique_school/view/grouplist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'maindrawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var con = Get.put(CourseTypeController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Unique-E-School"),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => UserDeshBoard()));
              },
              child: Icon(Icons.person),
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Obx(
          () => ListView.builder(
            itemCount: con.courseTypeList.length,
            itemBuilder: (context, index) {
              return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.blueGrey)),
                  child: ListTile(
                    onTap: () {
                      var id = con.courseTypeList[index].id;
                      Get.to(GroupListPage(), arguments: id);
                    },
                    title: Padding(
                      padding: EdgeInsets.all(9),
                      child: Text(
                        con.courseTypeList[index].coursetype,
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ));
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  print("Home");
                  Get.to(UserDeshBoard());
                },
                icon: Icon(Icons.home_max_outlined)),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {}, icon: Icon(Icons.home_max_outlined)),
            label: "Home",
          ),
        ]),
      ),
    );
  }
}
