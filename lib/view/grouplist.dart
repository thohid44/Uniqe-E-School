import 'package:e_unique_school/controller/group_controller.dart';
import 'package:e_unique_school/view/SubjectList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dataIndex = Get.arguments;
    var groupcontroller = Get.put(GroupController());
    groupcontroller.fetchCourse(dataIndex);
    // print(groupcontroller.courseTypeList.length);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.purple,
            title: const Text(" Group List"),
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                onPressed: () => Get.back())),
        body: Obx(
          () => ListView.builder(
            shrinkWrap: true,
            itemCount: groupcontroller.groupList.length,
            itemBuilder: (context, index) {
              if (ConnectionState.done == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.red,
                ));
              }

              return GestureDetector(
                onTap: () {
                  Get.to(SubjectList(),
                      arguments: groupcontroller.groupList[index].id);
                },
                child: Card(
                  child: ListTile(
                    title: Text(
                      groupcontroller.groupList[index].group,
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
