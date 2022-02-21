import 'package:e_unique_school/controller/CourseListController.dart';
import 'package:e_unique_school/view/Lessonview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          title: const Text("Full Course"),
          centerTitle: true,
        ),
        body: Obx(
          () => GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: allCourse.courseList.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.amber,
                  padding: EdgeInsets.all(10.0),
                  child: GestureDetector(
                      // onTap: () {
                      //   Get.to(LessonView(),
                      //       arguments:
                      //           allCourse.courseList[index].id.toString());
                      // },
                      // onTap: () {
                      //   var courseId = allCourse.courseList[index].id;
                      //   var coursePrice =
                      //       allCourse.courseList[index].selling_price;

                      //   Get.to(CourseCartPage(),
                      //       arguments: [courseId, coursePrice]);
                      // },
                      child: ListTile(
                          title:
                              Text(allCourse.courseList[index].course_name!))),
                );
              }),
        ),
      ),
    );
  }
}
