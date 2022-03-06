import 'package:e_unique_school/controller/SubjectController.dart';
import 'package:e_unique_school/view/CourseList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
          elevation: 0,
          backgroundColor: Color(0xFF009688),
          title: const Text("Subject List"),
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: subController.subjectList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(CourseList(),
                        arguments:
                            subController.subjectList[index].id.toString());
                  },
                  child: Card(
                    elevation: 5,
                    child: Container(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            subController.subjectList[index].subject.toString(),
                            style: GoogleFonts.acme(fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
