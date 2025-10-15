import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Image.asset("assets/back.png", height: 40, width: 40),
    );
  }
}
