import 'package:flutter/material.dart';
import 'package:scrabia/utils/colors.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.margin,
    this.height,
    this.width,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final double? height;
  final double? width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding ?? EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 1,
              // color: blackColor.withValues(alpha: 0.1),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
