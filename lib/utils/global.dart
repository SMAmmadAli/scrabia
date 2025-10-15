import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrabia/Widgets/success_and_warning_dialog.dart';

final authPadding = EdgeInsets.all(20);
final myPadding = EdgeInsets.all(15);
final heading = TextStyle(fontSize: 25, fontWeight: FontWeight.w500);
final semiBold = TextStyle(fontWeight: FontWeight.w600);

Widget height(double height) {
  return SizedBox(height: height);
}

Widget width(double width) {
  return SizedBox(width: width);
}

mySuccessDialog({
  required String title,
  required String subtitle,
  void Function()? ontap,
  String? btnTitle,
  String? secondBtnTitle,
  String? image,
  bool? secondButton,
  void Function()? secondOnTap,
}) {
  return showDialog(
    context: Get.context!,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 15),
        child: SuccessDialog(
          title: title,
          subtitle: subtitle,
          btnTitle: btnTitle,
          image: image,
          ontap:
              ontap ??
              () {
                Get.back();
              },
        ),
      );
    },
  );
}

myWarningDialog({
  required String title,
  required String subtitle,
  void Function()? ontap,
  String? btnTitle,
  String? secondBtnTitle,
  String? image,
  bool? secondButton,
  void Function()? secondOnTap,
}) {
  return showDialog(
    context: Get.context!,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 15),
        child: WarningDialog(
          title: title,
          subtitle: subtitle,
          btnTitle: btnTitle,
          image: image,
          ontap:
              ontap ??
              () {
                Get.back();
              },
        ),
      );
    },
  );
}

void myPrint(dynamic message) => debugPrint(message);
