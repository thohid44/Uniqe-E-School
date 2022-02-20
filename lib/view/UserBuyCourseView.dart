// import 'package:e_unique_school/controller/show_Buy_Course_Controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class UserBuyCourseView extends StatelessWidget {
//   final ShowBuyCourseController userCourse = Get.put(ShowBuyCourseController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("All video Course"),
//       ),
//       body: Obx(
//         () => ListView.builder(
//             itemCount: userCourse.buyCourseList.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(
//                   userCourse.buyCourseList[index].courseName,
//                   style: const TextStyle(
//                       fontSize: 22, fontWeight: FontWeight.bold),
//                 ),
//               );
//             }),
//       ),
//     );
//   }
// }
