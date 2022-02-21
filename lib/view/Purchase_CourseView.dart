import 'package:e_unique_school/controller/Purchase_Course_Controller.dart';
import 'package:e_unique_school/view/Lessonview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchaseCourseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var stdId = Get.arguments;
    print(stdId);
    var userCourse = Get.put(PurchaseCourseController());
    var userID = 2;
    userCourse.fetchPurchaseCourse(stdId);
    return Scaffold(
      appBar: AppBar(
        title: const Text("All video Course"),
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: userCourse.purchase_courses_list.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Get.to(LessonView(),
                      arguments: userCourse
                          .purchase_courses_list[index].course_id
                          .toString());
                },
                title: Text(
                  userCourse.purchase_courses_list[index].course_id,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  userCourse.purchase_courses_list[index].course_name,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              );
            }),
      ),
    );
  }
}
