import 'package:flutter/material.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Screens/BottomNavigationBar/Profile/profile_info.dart';
import 'package:scrabia/Screens/BottomNavigationBar/Profile/profile_password.dart';
import 'package:scrabia/Widgets/my_app_bar.dart';
import 'package:scrabia/Widgets/my_container.dart';
import 'package:scrabia/Widgets/my_tab_bar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Profile", showBack: false),
      body: Padding(
        padding: myPadding,
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              MyContainer(
                padding: myPadding,
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "assets/person.png",
                        height: 60,
                        width: 60,
                      ),
                    ),
                    width(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Profile Image",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        height(2),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Upload",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: textLightColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            width(10),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Remove",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              height(20),
              MyTabBar(tabOne: "Info", tabTwo: "Password"),
              height(20),
              Expanded(
                child: TabBarView(children: [ProfileInfo(), ProfilePassword()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
