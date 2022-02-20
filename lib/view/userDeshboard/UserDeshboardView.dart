import 'package:e_unique_school/widget/user_desh_widget.dart';
import 'package:flutter/material.dart';

class UserDeshBoardView extends StatelessWidget {
  const UserDeshBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Deshboard"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          children: [
            UserDeshWidget(
              title: "Video Course",
            ),
            UserDeshWidget(
              title: "PDF E-Book",
            ),
          ],
        ),
      ),
    );
  }
}
