// import 'package:flutter/material.dart';
// import 'package:e_unique_school/controller/LessonController.dart';
// import 'package:get/get.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class SingleCourseView extends StatelessWidget {
//   // The lesson Id come from Course List that means it's a course Id
//   var lesson_Id = Get.arguments;
//   final LessonController singleLessonController = Get.put(LessonController());

//   @override
//   Widget build(BuildContext context) {
//     singleLessonController.fetchLesson(lesson_Id);
//     print(singleLessonController.lessons.length);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Video Lesson"),
//         centerTitle: true,
//       ),
//       body: Obx(
//         () => ListView.builder(
//             itemCount: singleLessonController.lessons.length,
//             itemBuilder: (context, index) {
//               return YoutubePlayer(
//                 key: ObjectKey(singleLessonController.lessons[index].videoUrl),
//                 controller: YoutubePlayerController(
//                     initialVideoId:
//                         singleLessonController.lessons[index].videoUrl,
//                     flags: const YoutubePlayerFlags(autoPlay: false)),
//                 actionsPadding: const EdgeInsets.only(left: 16.0),
//                 bottomActions: [
//                   CurrentPosition(),
//                   const SizedBox(width: 10.0),
//                   ProgressBar(isExpanded: true),
//                   const SizedBox(width: 10.0),
//                   RemainingDuration(),
//                   FullScreenButton(),
//                 ],
//               );
//             }),
//       ),
//     );
//   }
// }
