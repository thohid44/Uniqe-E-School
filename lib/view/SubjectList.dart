import 'package:e_unique_school/controller/SubjectController.dart';
import 'package:e_unique_school/view/CourseList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var groupId = Get.arguments;
    print("Group id as Subjet Id ${groupId}");
    var subController = Get.put(SubjectController());
    subController.fetchSubject(groupId);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Subject List"),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: subController.subjectList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(CourseList(),
                    arguments: subController.subjectList[index].id.toString());
              },
              child: Card(
                child: Container(
                  child: ListTile(
                    subtitle: Text(
                      subController.subjectList[index].id.toString(),
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      subController.subjectList[index].subject.toString(),
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
