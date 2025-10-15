import 'package:flutter/material.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/Screens/BottomNavigationBar/Home/home_page.dart';
import 'package:scrabia/Screens/BottomNavigationBar/Profile/profile.dart';
import 'package:scrabia/Screens/BottomNavigationBar/MyAuctions/my_auctions.dart';
import 'package:scrabia/Screens/BottomNavigationBar/Request/buyer_request.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({super.key, this.index});

  final int? index;

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int selectedIndex = 0;
  @override
  void initState() {
    selectedIndex = widget.index ?? 0;
    super.initState();
  }

  final myList = [
    const HomePage(),
    const MyAuctions(fromBottomBar: true),
    const BuyerRequest(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myList.elementAt(selectedIndex),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            selectedLabelStyle: const TextStyle(height: 2),
            backgroundColor: mainThemeColor,
            selectedItemColor: whiteColor,
            // ignore: deprecated_member_use
            unselectedItemColor: whiteColor.withOpacity(0.8),
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Image.asset('assets/home.png', height: 20, width: 20),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Image.asset(
                    'assets/auctions.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                label: "My Auctions",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Image.asset(
                    'assets/request.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                label: "Request",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Image.asset(
                    'assets/profile.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
