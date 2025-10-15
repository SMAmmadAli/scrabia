import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Screens/BottomNavigationBar/MyAuctions/create_auction.dart';
import 'package:scrabia/Widgets/large_auction_widget.dart';
import 'package:scrabia/Widgets/my_app_bar.dart';
import 'package:scrabia/Widgets/my_drop_down.dart';
import 'package:scrabia/Widgets/my_text_field.dart';

class MyAuctions extends StatefulWidget {
  const MyAuctions({super.key, this.fromBottomBar = false});

  final bool fromBottomBar;

  @override
  State<MyAuctions> createState() => _MyAuctionsState();
}

class _MyAuctionsState extends State<MyAuctions> {
  TextEditingController searchController = TextEditingController();
  String? dropdownvalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "My Auctions",
        showBack: widget.fromBottomBar ? false : true,
      ),
      body: Padding(
        padding: myPadding,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * 0.5,
                  child: MyTextField(
                    controller: searchController,
                    textStyle: TextStyle(fontSize: 13.5),
                    bordersColor: Color(0xFFD8D8D8),
                    leading: Icon(
                      Icons.search,
                      // color: blackColor.withValues(alpha: 0.3),
                    ),
                    hintText: "Search auction",
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.4,
                  child: MyDropdown(
                    items: ["Newest first", "Oldest first"],
                    label: "Sort",
                    dropdownvalue: dropdownvalue,
                    onChanged: (value) {
                      setState(() {
                        dropdownvalue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            height(10),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(2),
                separatorBuilder: (context, index) => height(15),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return LargeAuctionWidget(
                    status: "Starting Soon",
                    image: "assets/nike.png",
                    title: "Nike",
                    price: "20.00",
                    description:
                        "Create your account with a simple 2-step registration process.",
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainThemeColor,
        onPressed: () {
          Get.to(() => CreateAuction());
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
