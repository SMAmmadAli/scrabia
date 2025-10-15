import 'package:flutter/material.dart';
import 'package:scrabia/utils/colors.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onTap,
    required this.label,
    this.secondary = false,
  });

  final VoidCallback? onTap;
  final String label;
  final bool? secondary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            secondary == true ? whiteColor : mainThemeColor,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(color: mainThemeColor),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        child: FittedBox(
          child: Text(
            label,
            style: TextStyle(
              color: secondary == true ? mainThemeColor : whiteColor,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
