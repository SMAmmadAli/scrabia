import 'package:flutter/material.dart';
import 'package:scrabia/utils/colors.dart';

class MyTabBar extends StatelessWidget {
  final String tabOne;
  final String tabTwo;
  final String? tabThree;
  final String? tabFour;
  final bool isScroll;
  const MyTabBar({
    super.key,
    required this.tabOne,
    required this.tabTwo,
    this.tabThree,
    this.isScroll = false,
    this.tabFour,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            // color: blackColor.withValues(alpha: 0.1),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
        // border: Border.all(color: mainThemeColor),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Material(
          color: Colors.transparent,
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            dividerHeight: 0,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                colors: [Color(0xFF0B5064), Color(0xFF127997)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 1.0],
              ),
            ),
            labelColor: whiteColor,
            isScrollable: isScroll,
            tabAlignment: isScroll == true ? TabAlignment.center : null,
            unselectedLabelColor: blackColor,
            unselectedLabelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            tabs: [
              Tab(text: tabOne),
              Tab(text: tabTwo),
              if (tabThree != null) Tab(text: tabThree),
              if (tabFour != null) Tab(text: tabFour),
            ],
          ),
        ),
      ),
    );
  }
}
