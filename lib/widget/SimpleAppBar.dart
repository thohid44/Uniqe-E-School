import 'package:flutter/material.dart';

class SimpleAppBar extends StatelessWidget {
  SimpleAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF009688),
      title: const Text("Unique E School"),
      centerTitle: true,
      actions: [],
    );
  }
}
