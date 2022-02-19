import 'package:e_unique_school/controller/LessonController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonView extends StatelessWidget {
  LessonView({Key? key}) : super(key: key);
  final LessonController lesControoler = Get.put(LessonController());
  @override
  Widget build(BuildContext context) {
    print(lesControoler.lessons.length);
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Lesson"),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: lesControoler.lessons.length,
            itemBuilder: (context, index) {
              return YoutubePlayer(
                key: ObjectKey(lesControoler.lessons[index].videoUrl),
                controller: YoutubePlayerController(
                    initialVideoId: lesControoler.lessons[index].videoUrl,
                    flags: const YoutubePlayerFlags(autoPlay: false)),
                actionsPadding: const EdgeInsets.only(left: 16.0),
                bottomActions: [
                  CurrentPosition(),
                  const SizedBox(width: 10.0),
                  ProgressBar(isExpanded: true),
                  const SizedBox(width: 10.0),
                  RemainingDuration(),
                  FullScreenButton(),
                ],
              );
            }),
      ),
    );
  }
}