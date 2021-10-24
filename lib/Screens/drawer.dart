import 'package:flutter/material.dart';
import 'package:todo_app_ui/Constant/colors.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.tileBlue,
      body: SafeArea(
        child: Container(
          height: height - kToolbarHeight,
          width: width,
          color: AppColor.tileBlue,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height / 3,
                  width: width,
                  child: Stack(
                    children: [
                      Positioned(
                        top: (height / 3) / 3,
                        right: 100,
                        child: Container(
                          height: 55,
                          width: 55,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey.withOpacity(.7),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        left: 50,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: 30,
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1633177317976-3f9bc45e1d1d?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 40,
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: CircularProgressIndicator(
                            strokeWidth: 5,
                            value: 2 / 4,
                            backgroundColor: Colors.grey.withOpacity(.5),
                            valueColor: AlwaysStoppedAnimation(AppColor.pink),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  child: SizedBox(
                    child: const Text(
                      'Code With Nix',
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    width: width / 3,
                  ),
                ),
                buildTab(width, Icons.bookmark_border_outlined, 'Templates'),
                buildTab(width, Icons.category_outlined, 'Categories'),
                buildTab(width, Icons.analytics_outlined, 'Analytics'),
                buildTab(width, Icons.exit_to_app, 'Logout'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTab(double width, IconData? icon, String title) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: width / 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: AppColor.lightGrey,
                size: 28,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
