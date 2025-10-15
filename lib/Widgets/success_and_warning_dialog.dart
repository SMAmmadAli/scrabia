import 'package:flutter/material.dart';
import 'package:scrabia/utils/colors.dart';
import 'package:scrabia/Widgets/my_button.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    super.key,
    required this.ontap,
    required this.title,
    required this.subtitle,
    this.btnTitle,
    this.image,
  });

  final String title;
  final String subtitle;
  final String? btnTitle;
  final String? image;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Image.asset(image ?? 'assets/success.png', scale: 4),
            const SizedBox(height: 20),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16,
                  // color: blackColor.withValues(alpha: 0.5),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            MyButton(label: btnTitle ?? 'Done', onTap: ontap),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class WarningDialog extends StatelessWidget {
  const WarningDialog({
    super.key,
    required this.ontap,
    required this.title,
    required this.subtitle,
    this.btnTitle,
    this.image,
  });

  final String title;
  final String subtitle;
  final String? btnTitle;
  final String? image;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Image.asset(image ?? 'assets/warning.png', height: 80, width: 80),
            const SizedBox(height: 20),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16,
                  // color: blackColor.withValues(alpha: 0.5),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            MyButton(label: btnTitle ?? 'Done', onTap: ontap),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
