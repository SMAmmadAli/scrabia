import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrabia/utils/colors.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.maxLength,
    this.onTap,
    this.maxLines,
    this.isObscure = false,
    this.readOnly = false,
    this.autoFocus = false,
    this.filled = false,
    this.keyboardType,
    this.onChanged,
    this.trailing,
    this.leading,
    this.defaultValue,
    this.validation,
    this.textInputAction,
    this.fillColor,
    this.onEditComplete,
    this.inputFormatters,
    this.textStyle,
    this.hintStyle,
    this.focusNode,
    this.bordersColor,
  });

  final String hintText;
  final bool isObscure;
  final bool readOnly;
  final bool autoFocus;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final int? maxLines;
  final Widget? trailing;
  final Widget? leading;
  final bool? filled;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final String? defaultValue;
  final String? Function(String?)? validation;
  final Color? fillColor;
  final void Function()? onEditComplete;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;
  final Color? bordersColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: TextFormField(
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        style: textStyle,
        focusNode: focusNode,
        inputFormatters: inputFormatters,
        textInputAction: maxLines == null
            ? TextInputAction.done
            : TextInputAction.newline,
        onTap: onTap,
        autofocus: autoFocus,
        onEditingComplete: onEditComplete,
        validator: validation,
        maxLines: maxLines ?? 1,
        initialValue: defaultValue,
        controller: controller,
        readOnly: readOnly,
        obscureText: isObscure,
        keyboardType: keyboardType,
        onChanged: onChanged,
        maxLength: maxLength,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          fillColor: fillColor ?? whiteColor,
          filled: filled,
          contentPadding: const EdgeInsets.all(12.0),
          suffixIcon: trailing,
          prefixIcon: leading,
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: bordersColor ?? borderColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: bordersColor ?? borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: bordersColor ?? borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintStyle:
              hintStyle ??
              TextStyle(
                // color: blackColor.withValues(alpha: 0.5), 
                fontSize: 13),
          hintText: hintText,
        ),
      ),
    );
  }
}
