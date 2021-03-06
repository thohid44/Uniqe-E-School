import 'package:e_unique_school/auth/Login.dart';
import 'package:e_unique_school/view/homepage.dart';
import 'package:e_unique_school/view/userDeshboard/UserDeshboardView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MainDrawer extends StatefulWidget {
  MainDrawer({Key? key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(35),
        bottomRight: Radius.circular(35),
      ),
      child: Drawer(
        backgroundColor: Color(0xFF009688),
        child: Column(
          children: [
            Expanded(
                child: ListView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: [
                  // DrawerHeader(
                  //     child: Center(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(30.0),
                  //     child: Image.asset("assets/school.png"),
                  //     //SvgPicture.asset(AppImages.appLogo),
                  //   ),
                  // )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.home_max,
                      color: Colors.white,
                    ),
                    title: Text("Deshboard",
                        style: GoogleFonts.lato(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                    onTap: () {
                      Get.to(UserDeshBoardView());
                      // scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                  Divider(height: 0),
                  // ListTile(
                  //   leading: Icon(Icons.account_circle_outlined),
                  //   title: Text("Sign in"),
                  // ),
                  // Divider(height: 0),
                  // ListTile(
                  //   leading: Icon(Icons.favorite_border),
                  //   title: Text("Wishlist"),
                  // ),
                  // Divider(height: 0),
                  // ListTile(
                  //     leading: Icon(Icons.g_translate_outlined),
                  //     title: Text("Change Language")),
                  // Divider(height: 0),
                  ListTile(
                    onTap: () {
                      //   Share.share("Share App",
                      //  subject:"https://play.google.com/store/apps/details?id=com.media365ltd.doctime"
                    },
                    leading: Icon(
                      Icons.share_outlined,
                      color: Colors.white,
                    ),
                    title: Text("Share App",
                        style: GoogleFonts.lato(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                  ),
                  const Divider(height: 0),
                  ListTile(
                      leading: Icon(
                        Icons.stars_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Rate App",
                        style: GoogleFonts.lato(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      )),
                  const Divider(height: 0),
                  ListTile(
                    leading: Icon(
                      Icons.call_outlined,
                      color: Colors.white,
                    ),
                    title: Text("Contact Us",
                        style: GoogleFonts.lato(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                  ),
                  Divider(height: 0),
                  ListTile(
                    onTap: () {
                      Get.to(Login());
                    },
                    leading: Icon(
                      Icons.logout_outlined,
                      color: Colors.white,
                    ),
                    title: Text("Logout",
                        style: GoogleFonts.lato(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                  ),
                  Divider(height: 0),
                ])),
            // SizedBox(
            //   height: 150,
            //   child: Row(
            //     children: [
            //       Flexible(
            //           flex: 1,
            //           child: Container(
            //             height: 100,
            //             child: Container(
            //               width: MediaQuery.of(context).size.width,
            //               height: MediaQuery.of(context).size.height,
            //               margin: EdgeInsets.symmetric(horizontal: 10),
            //               decoration: BoxDecoration(
            //                   color: Colors.grey[200],
            //                   borderRadius: BorderRadius.circular(20),
            //                   border:
            //                       Border.all(color: Colors.deepOrange, width: 2)),
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Icon(
            //                     Icons.forum_outlined,
            //                     size: 30,
            //                   ),
            //                   Text("Live Chat")
            //                 ],
            //               ),
            //             ),
            //           )),
            //       Flexible(
            //           flex: 1,
            //           child: Container(
            //             height: 100,
            //             child: Container(
            //               width: MediaQuery.of(context).size.width,
            //               height: MediaQuery.of(context).size.height,
            //               margin: EdgeInsets.symmetric(horizontal: 10),
            //               decoration: BoxDecoration(
            //                   color: Colors.grey[200],
            //                   borderRadius: BorderRadius.circular(20),
            //                   border:
            //                       Border.all(color: Colors.deepOrange, width: 2)),
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Icon(
            //                     Icons.phone,
            //                     size: 30,
            //                   ),
            //                   Text("Phone")
            //                 ],
            //               ),
            //             ),
            //           )),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
