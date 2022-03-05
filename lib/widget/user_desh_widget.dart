import 'package:flutter/material.dart';

class UserDeshWidget extends StatelessWidget {
  final String title;
  UserDeshWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.purple),
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          const SizedBox(
            height: 14,
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.deepPurple),
            ),
          ),
        ],
      ),
    );
  }
}
