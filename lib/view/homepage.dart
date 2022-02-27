import 'package:e_unique_school/controller/course_type_controller.dart';
import 'package:e_unique_school/view/ebook/ebook_home.dart';
import 'package:e_unique_school/view/grouplist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'maindrawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var con = Get.put(CourseTypeController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF009688),
          title: const Text("Unique E School"),
          centerTitle: true,
          actions: [],
        ),
        drawer: MainDrawer(),
        body: Obx(
          () => ListView.builder(
            itemCount: con.courseTypeList.length,
            itemBuilder: (context, index) {
              return Shimmer(
                  duration: Duration(seconds: 2),
                  interval: Duration(seconds: 4),
                  color: Colors.white,
                  colorOpacity: 0.1,
                  direction: ShimmerDirection.fromLBRT(),
                  enabled: true,
                  child: Card(
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
                    ),
                  ));

              // Padding(
              //   padding: const EdgeInsets.only(left: 10, right: 10),
              //   child: Stack(
              //     children: [
              //       Container(
              //         height: 200,
              //         decoration: BoxDecoration(
              //             color: Colors.purple[100],
              //             borderRadius: BorderRadius.circular(20)),
              //       ),
              //       Positioned(
              //           bottom: 0,
              //           child: Container(
              //             height: 50,
              //             width: 200,
              //             color: Colors.purple,
              //             child: Center(
              //               child: Text(
              //                 con.courseTypeList[index].coursetype,
              //                 style: const TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 23,
              //                     fontWeight: FontWeight.bold),
              //               ),
              //             ),
              //           ))
              //     ],
              //   ),
              // );
            },
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  print("Home");
                },
                icon: Icon(Icons.home_max_outlined)),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EbookHome()));
                },
                icon: Icon(Icons.home_max_outlined)),
            label: "Ebook",
          ),
        ]),
      ),
    );
  }
}
