import 'dart:io';

import 'package:e_unique_school/auth/Login.dart';
import 'package:e_unique_school/view/ebook/ebook_home.dart';
import 'package:e_unique_school/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() {
  runApp(MyApp());
  HttpOverrides.global = MyHttpOverrides();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class OnScreenPage extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Image.network("https://domaine.com/image.png", height: 175.0),
          title: 'Learn Coding online',
          body: 'Subscribe to Divine Coding to learn coding',
          footer: Text("@Codex Coding"),
          decoration: PageDecoration(pageColor: Colors.deepPurple)),
      PageViewModel(
          image: Image.network("https://domaine.com/image.png", height: 175.0),
          title: 'Learn Coding online',
          body: 'Subscribe to Divine Coding to learn coding',
          footer: Text("@Codex Coding"),
          decoration: PageDecoration(
            pageColor: Colors.cyan,
          )),
      PageViewModel(
          image: Image.network(
              "https://www.freestudy.com/wp-content/uploads/2019/11/Education-800x512.jpg?ezimgfmt=ng%3Awebp%2Fngcb1%2Frs%3Adevice%2Frscb1-1",
              height: 175.0),
          title: 'Learn Coding online',
          body: 'Subscribe to Divine Coding to learn coding',
          footer: Text("@Codex Coding"),
          decoration: PageDecoration(pageColor: Colors.amber)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      onDone: () {
        Get.to(HomePage());
      },
      onSkip: () {
        Get.to(HomePage());
      },
      pages: getPages(),
      globalBackgroundColor: Colors.white,
      showSkipButton: true,
      showDoneButton: true,
      showNextButton: false,
      skip: const Text("Skip"),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
    ));
  }
}
