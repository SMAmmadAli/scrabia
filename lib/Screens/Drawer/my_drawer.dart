import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrabia/Auth/login_view.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Screens/BottomNavigationBar/Home/auctions_list.dart';
import 'package:scrabia/Screens/BottomNavigationBar/MyAuctions/my_auctions.dart';
import 'package:scrabia/Screens/Drawer/ended_auctions.dart';
import 'package:scrabia/Screens/Drawer/interested_auctions.dart';
import 'package:scrabia/Screens/Drawer/my_rating.dart';
import 'package:scrabia/Screens/Drawer/under_execution.dart';
import 'package:scrabia/Screens/Drawer/won_auctions.dart';
import 'package:scrabia/Widgets/back_widget.dart';
import 'package:scrabia/Widgets/drawer_widget.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        child: Padding(
          padding: myPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(30),
              BackWidget(),
              height(20),
              Container(
                padding: EdgeInsets.all(5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFCDF4FF),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: mainThemeColor, width: 1.5),
                ),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset("assets/person.png", height: 50),
                    ),
                    width(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Harry Johnson",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            width(15),
                            Icon(Icons.star, color: Colors.amber, size: 15),
                            width(5),

                            Text("(4.9)", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        Text(
                          "Johnson@gmail.com",
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.edit, size: 20),
                  ],
                ),
              ),
              height(30),
              DrawerWidget(
                image: "assets/my_auctions.png",
                text: "My Auctions",
                onTap: () {
                  Get.to(() => MyAuctions());
                },
              ),
              DrawerWidget(
                image: "assets/draft.png",
                text: "Draft Auctions",
                onTap: () {
                  Get.to(() => AuctionsList());
                },
              ),
              DrawerWidget(
                image: "assets/review.png",
                text: "Review",
                onTap: () {
                  Get.to(() => MyRating());
                },
              ),
              DrawerWidget(
                image: "assets/my_auctions.png",
                text: "Interested Auctions",
                onTap: () {
                  Get.to(() => InterestedAuctions());
                },
              ),
              DrawerWidget(
                image: "assets/under_execution.png",
                text: "Under Execution",
                onTap: () {
                  Get.to(() => UnderExecution());
                },
              ),
              DrawerWidget(
                image: "assets/review.png",
                text: "Won Auctions",
                onTap: () {
                  Get.to(() => WonAuctions());
                },
              ),
              DrawerWidget(
                image: "assets/ended.png",
                text: "Ended Auctions",
                onTap: () {
                  Get.to(() => EndedAuctions());
                },
              ),
              height(30),
              GestureDetector(
                onTap: () {
                  Get.offAll(() => const LoginPage());
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    // color: whiteColor.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFC9C0C0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Logout"),
                      Icon(Icons.arrow_forward_ios, size: 20),
                    ],
                  ),
                ),
              ),
              height(10),
            ],
          ),
        ),
      ),
    );
  }
}
