import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/utils/global.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
    required this.number,
    required this.linearPercentage,
  });

  final int number;
  final int linearPercentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$number Star", style: TextStyle(fontWeight: FontWeight.w600)),
        width(7),
        SizedBox(
          width: Get.width * 0.25,
          child: RatingBar.builder(
            itemSize: 17,
            initialRating: double.parse(number.toString()),
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: number.toInt(),
            ignoreGestures: true,
            itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
            onRatingUpdate: (rating) {
              myPrint(rating);
            },
          ),
        ),
        width(5),
        SizedBox(
          height: 20,
          width: Get.width * 0.3,
          child: LinearProgressIndicator(
            borderRadius: BorderRadius.circular(6),
            value: linearPercentage / 100,
            backgroundColor: borderColor,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xffF38744)),
          ),
        ),
        Spacer(),
        Text("$linearPercentage%"),
      ],
    );
  }
}
