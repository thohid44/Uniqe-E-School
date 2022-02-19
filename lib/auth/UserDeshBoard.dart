import 'package:e_unique_school/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDeshBoard extends StatefulWidget {
  @override
  State<UserDeshBoard> createState() => _UserDeshBoardState();
}

class _UserDeshBoardState extends State<UserDeshBoard> {
  // Future<void> loadData() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var mapData = json.decode(preferences.getString("sharedata")!);
  //   print("Student Id $mapData");

  //   setState(() {
  //     studentId = mapData['studentId'].toString();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Column(
        children: [
          GridView.builder(
              itemCount: 4,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Container(
                    child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 80,
                      child: Icon(
                        Icons.co2_sharp,
                        size: 50,
                      ),
                    )
                  ],
                ));
              })
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: IconButton(
              onPressed: () {
                print("Home");
                Get.back();
              },
              icon: Icon(Icons.home_max_outlined)),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon:
              IconButton(onPressed: () {}, icon: Icon(Icons.home_max_outlined)),
          label: "Home",
        ),
      ]),
    );
  }
}
