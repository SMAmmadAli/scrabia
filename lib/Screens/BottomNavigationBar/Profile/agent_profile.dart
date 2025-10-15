import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Widgets/auction_widget.dart';
import 'package:scrabia/Widgets/my_app_bar.dart';
import 'package:scrabia/Widgets/my_container.dart';
import 'package:scrabia/Widgets/my_tab_bar.dart';
import 'package:scrabia/Widgets/rating_container.dart';

class AgentProfile extends StatefulWidget {
  const AgentProfile({super.key});

  @override
  State<AgentProfile> createState() => _AgentProfileState();
}

class _AgentProfileState extends State<AgentProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Profile"),
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
                          "John Smith",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        height(2),
                        Row(
                          children: [
                            RatingBar.builder(
                              itemSize: 15,
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              ignoreGestures: true,
                              itemBuilder: (context, _) =>
                                  Icon(Icons.star, color: Colors.amber),
                              onRatingUpdate: (rating) {
                                myPrint(rating);
                              },
                            ),

                            width(5),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "4.5",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: textLightColor,
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
              MyTabBar(tabOne: "Auctions", tabTwo: "Review"),
              height(20),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView.builder(
                      itemCount: 8,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.55,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return AuctionWidget(
                          status: "Starting Soon",
                          image: "assets/nike.png",
                          title: "Nike",
                          price: "20.00",
                          description:
                              "Create your account with a simple 2-step registration process.",
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(children: [RatingContainer()]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
