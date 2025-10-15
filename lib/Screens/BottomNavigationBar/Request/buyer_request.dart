import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Screens/BottomNavigationBar/Request/request_detail.dart';
import 'package:scrabia/Widgets/my_app_bar.dart';
import 'package:scrabia/Widgets/my_container.dart';

class BuyerRequest extends StatefulWidget {
  const BuyerRequest({super.key});

  @override
  State<BuyerRequest> createState() => _BuyerRequestState();
}

class _BuyerRequestState extends State<BuyerRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Request"),
      body: ListView.separated(
        padding: myPadding,
        separatorBuilder: (context, index) => height(15),
        itemCount: 4,
        itemBuilder: (context, index) {
          return MyContainer(
            onTap: () {
              Get.to(() => RequestDetail());
            },
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/person.png",
                    height: 55,
                    width: 55,
                  ),
                ),
                width(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * 0.3,
                      child: Text(
                        "iPhone 15 Pro",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    height(5),
                    Text(
                      "Seller: TechStars",
                      style: TextStyle(fontSize: 13, color: textLightColor),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$210.00",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    height(5),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFC467),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            "View Invoice",
                            style: TextStyle(color: blackColor),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
