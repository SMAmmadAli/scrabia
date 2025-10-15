import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Widgets/my_app_bar.dart';
import 'package:scrabia/Widgets/my_container.dart';
import 'package:scrabia/Widgets/rating_container.dart';

class MyRating extends StatefulWidget {
  const MyRating({super.key});

  @override
  State<MyRating> createState() => _MyRatingState();
}

class _MyRatingState extends State<MyRating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Rating"),
      body: Padding(
        padding: myPadding,
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
            RatingContainer(),
          ],
        ),
      ),
    );
  }
}
