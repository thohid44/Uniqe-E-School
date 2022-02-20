import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
              child: ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                DrawerHeader(
                    child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Icon(Icons.abc)
                      //SvgPicture.asset(AppImages.appLogo),
                      ),
                )),
                ListTile(
                  leading: Icon(Icons.home_outlined),
                  title: Text("Home"),
                  onTap: () {
                    Navigator.of(context).pop();
                    // scaffoldKey.currentState!.openDrawer();
                  },
                ),
                Divider(height: 0),
                ListTile(
                  leading: Icon(Icons.account_circle_outlined),
                  title: Text("Sign in"),
                ),
                Divider(height: 0),
                ListTile(
                  leading: Icon(Icons.favorite_border),
                  title: Text("Wishlist"),
                ),
                Divider(height: 0),
                ListTile(
                    leading: Icon(Icons.g_translate_outlined),
                    title: Text("Change Language")),
                Divider(height: 0),
                ListTile(
                    onTap: () {
                      //   Share.share("Share App",
                      //  subject:"https://play.google.com/store/apps/details?id=com.media365ltd.doctime"
                    },
                    leading: Icon(Icons.share_outlined),
                    title: Text("Share App")),
                Divider(height: 0),
                ListTile(
                    leading: Icon(Icons.stars_outlined),
                    title: Text("Rate App")),
                Divider(height: 0),
                ListTile(
                  leading: Icon(Icons.call_outlined),
                  title: Text("Contact Us"),
                ),
                Divider(height: 0),
                ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text("Help & Info"),
                    onTap: () {
                      Navigator.of(context).pop();
                    }),
                Divider(height: 0),
              ])),
          SizedBox(
            height: 150,
            child: Row(
              children: [
                Flexible(
                    flex: 1,
                    child: Container(
                      height: 100,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: Colors.deepOrange, width: 2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.forum_outlined,
                              size: 30,
                            ),
                            Text("Live Chat")
                          ],
                        ),
                      ),
                    )),
                Flexible(
                    flex: 1,
                    child: Container(
                      height: 100,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: Colors.deepOrange, width: 2)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phone,
                              size: 30,
                            ),
                            Text("Phone")
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
