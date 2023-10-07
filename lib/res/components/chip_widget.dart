import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    super.key,
    required this.label,
    this.backgroundColor,
    this.labeColor, this.padding,
  });

  final String label;
  final Color? backgroundColor;
  final Color? labeColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Chip(
      shadowColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 5,
      side: const BorderSide(
        width: 0.1,
        color: Colors.white,
      ),
      padding:padding,
      backgroundColor: backgroundColor,
      label: Text(label),
      labelStyle: TextStyle(
        color: labeColor,
        fontFamily: "Inter",
        fontSize: 12,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
