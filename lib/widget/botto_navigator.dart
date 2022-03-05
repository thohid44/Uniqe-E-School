import 'package:e_unique_school/Utils/AppColors.dart';
import 'package:e_unique_school/view/ebook/ebook_home.dart';
import 'package:e_unique_school/view/homepage.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(40.0), topLeft: Radius.circular(40.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                icon: Icon(
                  Icons.home,
                  color: AppColors.whiteColor,
                  size: 35,
                )),
            const SizedBox(),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const EbookHome()));
                },
                icon: Icon(Icons.book_online_sharp,
                    size: 30, color: AppColors.grayColor)),
          ],
        ),
      ),
    );
  }
}
