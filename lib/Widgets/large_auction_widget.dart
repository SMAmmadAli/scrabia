import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Screens/BottomNavigationBar/auction_detail.dart';
import 'package:scrabia/Widgets/my_container.dart';

class LargeAuctionWidget extends StatelessWidget {
  const LargeAuctionWidget({
    super.key,
    required this.status,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    this.btnTitle,
  });

  final String status;
  final String image;
  final String title;
  final String price;
  final String description;
  final String? btnTitle;

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      onTap: () {
        Get.to(() => AuctionDetail());
      },
      borderRadius: 3,
      padding: EdgeInsets.all(8),
      // make width responsive by using parent constraints (Expanded)
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Image.asset(
                  image,
                  height: Get.height * 0.2,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: 5,
                left: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 7),
                  decoration: BoxDecoration(
                    color: status == "Starting Soon"
                        ? Color(0xFFE89003)
                        : Colors.green,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(color: whiteColor, fontSize: 11.5),
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite_outline, size: 17),
                ),
              ),
            ],
          ),
          height(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Text(
                "\$$price",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ],
          ),
          height(8),
          Text(
            description,
            style: TextStyle(color: textLightColor, fontSize: 13.5),
          ),
          height(10),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: null,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(mainThemeColor),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    side: BorderSide(color: mainThemeColor),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              child: btnTitle != null
                  ? Text(
                      btnTitle!,
                      style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w600,
                        // letterSpacing: 0.5,
                        fontSize: 14,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "View Auction",
                          style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.w600,
                            // letterSpacing: 0.5,
                            fontSize: 14,
                          ),
                        ),
                        Spacer(),
                        Image.asset("assets/watch.png", height: 18, width: 18),
                        width(10),
                        Text(
                          "02 : 12 : 54",
                          style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.w600,
                            // letterSpacing: 0.5,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
