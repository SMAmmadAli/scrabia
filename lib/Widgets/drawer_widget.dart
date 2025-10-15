import 'package:flutter/material.dart';
import 'package:scrabia/utils/global.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });

  final String image;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFB9B9B9)),
            color: Color(0xFFF4F4F4),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Image.asset(image, scale: 2),
              width(20),
              Text(text, style: TextStyle(fontSize: 16)),
              Spacer(),
              Image.asset("assets/arrow.png", scale: 3),
            ],
          ),
        ),
      ),
    );
  }
}
