import 'package:e_unique_school/controller/CourseListController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseList extends StatelessWidget {
  var courseId = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final allCourse = Get.put(CourseListController());
    allCourse.fetchCourseList(courseId);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Course Content"),
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
              itemBuilder: (BuildContext context, index) {
                return Card(
                  elevation: 5,
                  color: Colors.deepPurple,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    child: Text(
                      allCourse.courseList[index].course_name!,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
