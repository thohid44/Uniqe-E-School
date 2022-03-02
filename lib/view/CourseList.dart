import 'package:e_unique_school/controller/CourseListController.dart';
import 'package:e_unique_school/view/CourseCartPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseList extends StatelessWidget {
  // Arguments from Subject List

  @override
  Widget build(BuildContext context) {
    var courseId = Get.arguments;

    print("Subject Id as Course Id  ${courseId}");
    final allCourse = Get.put(CourseListController());
    allCourse.fetchCourseList(courseId);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(" Course List"),
          centerTitle: true,
          backgroundColor: Color(0xFF009688),
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5, top: 10),
            child: ListView.builder(
                itemCount: allCourse.courseList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      var id = allCourse.courseList[index].id.toString();
                      var price =
                          allCourse.courseList[index].selling_price.toString();
                      Get.to(CourseCartPage(), arguments: [id, price]);
                    },
                    child: Card(
                      elevation: 4.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 120,
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Image.network(
                                allCourse.courseList[index].image.toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            height: 120,
                            alignment: Alignment.topCenter,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${allCourse.courseList[index].course_name}",
                                    style: GoogleFonts.adventPro(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    "Price: ${allCourse.courseList[index].selling_price}",
                                    style: GoogleFonts.adventPro(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                    "Duration: ${allCourse.courseList[index].course_duration}",
                                    style: GoogleFonts.adventPro(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
