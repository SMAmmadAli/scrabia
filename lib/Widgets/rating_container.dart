import 'package:flutter/material.dart';
import 'package:scrabia/utils/global.dart';
import 'package:scrabia/Widgets/my_container.dart';
import 'package:scrabia/Widgets/rating_row.dart';

class RatingContainer extends StatelessWidget {
  const RatingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Rating (72)",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          height(20),
          RatingRow(number: 5, linearPercentage: 78),
          height(5),
          RatingRow(number: 4, linearPercentage: 50),
          height(5),
          RatingRow(number: 3, linearPercentage: 30),
          height(5),
          RatingRow(number: 2, linearPercentage: 20),
          height(5),
          RatingRow(number: 1, linearPercentage: 7),
        ],
      ),
    );
  }
}
