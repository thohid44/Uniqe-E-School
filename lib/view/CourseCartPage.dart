import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/CourseListController.dart';

class CourseCartPage extends StatefulWidget {
  @override
  State<CourseCartPage> createState() => _CourseCartPageState();
}

class _CourseCartPageState extends State<CourseCartPage> {
  final GlobalKey<FormState> _key = GlobalKey();

  // TextEditingController uId = TextEditingController();
  // TextEditingController uname = TextEditingController();
  // TextEditingController price = TextEditingController();
  // TextEditingController courseId = TextEditingController();

  TextEditingController mobile = TextEditingController();
  TextEditingController txtId = TextEditingController();
  int userId = 90;
  String uname = "Abid";
  var courseListArguments = Get.arguments;

  // Future<void> loadUserData() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var mapData = json.decode(preferences.getString("sharedata")!);
  //   print("Student Id $mapData");

  //   setState(() {
  //     userId = mapData['studentId'].toString();
  //   });
  // }

  // void initState() {
  //   loadUserData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final CourseListController courseController = Get.find();
    return Scaffold(
      appBar: AppBar(title: const Text("Course Buy Page")),
      body: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                Text(
                  "User Id: ${userId}",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "User Id: ${uname}",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 65,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(171, 255, 255, 255),
                      borderRadius: BorderRadius.circular(30)),
                  child: TextField(
                    controller: mobile,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 65,
                  child: TextField(
                    controller: txtId,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(
                  height: 29,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * .2,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(30)),
                  child: ElevatedButton(
                      onPressed: () {
                        courseController.cartCourse(
                            userId.toString(),
                            uname.toString(),
                            courseListArguments[0],
                            courseListArguments[1],
                            mobile.text,
                            txtId.text);
                      },
                      child: const Text("Submit",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold))),
                )
              ],
            ),
          )),
    );
  }
}
