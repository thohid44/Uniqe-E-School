import 'package:flutter/material.dart';

class UserDeshWidget extends StatelessWidget {
  final String title;

  const UserDeshWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
          color: Colors.purple, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.deepPurple,
            radius: 50,
            child: Text(
              "2",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
