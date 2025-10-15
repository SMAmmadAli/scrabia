import 'package:flutter/material.dart';
import 'package:scrabia/utils/colors.dart';

class MyDropdown extends StatefulWidget {
  final String label;
  final List<String?>? items;
  final String? dropdownvalue;
  final void Function(String?)? onChanged;
  final double? height;
  final double? width;
  final bool? secondary;
  final Widget? icon;
  final String? Function(String?)? validation;

  // new optional styling params to match MyTextField
  final Color? fillColor;
  final bool? filled;
  final Color? bordersColor;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  const MyDropdown({
    super.key,
    required this.items,
    required this.label,
    required this.dropdownvalue,
    required this.onChanged,
    this.height,
    this.width,
    this.secondary = false,
    this.validation,
    this.icon,
    this.fillColor,
    this.filled,
    this.bordersColor,
    this.hintStyle,
    this.textStyle,
  });

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String?>(
        // initialValue: widget.dropdownvalue,
        validator: widget.validation,
        onChanged: widget.onChanged,
        isExpanded: true,
        icon: widget.icon ?? const Icon(Icons.keyboard_arrow_down_outlined),
        iconEnabledColor: textLightColor,
        iconDisabledColor: textLightColor,
        style:
            widget.textStyle ??
            const TextStyle(fontSize: 13, color: Colors.black),
        dropdownColor: whiteColor,
        decoration: InputDecoration(
          fillColor: widget.fillColor ?? whiteColor,
          filled: widget.filled ?? false,
          contentPadding: const EdgeInsets.all(12.0),
          // keeps the same look as MyTextField
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: widget.bordersColor ?? Color(0xFFD8D8D8),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.bordersColor ?? Color(0xFFD8D8D8),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.bordersColor ?? Color(0xFFD8D8D8),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintStyle:
              widget.hintStyle ??
              TextStyle(
                // color: blackColor.withValues(alpha: 0.5), 
                fontSize: 13),
          hintText: widget.label,
        ),
        items: (widget.items ?? <String?>[])
            .map(
              (String? item) => DropdownMenuItem<String?>(
                value: item,
                child: Text(
                  item ?? '',
                  style:
                      widget.textStyle ??
                      const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
