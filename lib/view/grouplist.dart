import 'package:e_unique_school/controller/group_controller.dart';
import 'package:e_unique_school/view/SubjectList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final groupcontroller = Get.put(GroupController());

    var dataIndex = Get.arguments;
    groupcontroller.fetchGroup(dataIndex);
    // print(groupcontroller.courseTypeList.length);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFF009688),
            title: const Text(" Group List"),
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                onPressed: () => Get.back())),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: groupcontroller.groupList.length,
                itemBuilder: (context, index) {
                  if (groupcontroller.groupList.isEmpty) {
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
                        elevation: 5,
                        child: Container(
                          height: MediaQuery.of(context).size.height * .1,
                          child: Center(
                            child: Text(
                              groupcontroller.groupList[index].group,
                              style: GoogleFonts.pacifico(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        )),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
