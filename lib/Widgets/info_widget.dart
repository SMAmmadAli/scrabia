import 'package:flutter/material.dart';
import 'package:scrabia/utils/colors.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, required this.textOne, required this.textTwo});

  final String textOne;
  final String textTwo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(textOne, style: TextStyle(color: textLightColor)),
          Text(textTwo, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
