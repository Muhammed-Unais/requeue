import 'package:flutter/material.dart';

class HomeChipWidget extends StatelessWidget {
  const HomeChipWidget({
    super.key,
    required this.label,
    this.backgroundColor,
    this.labeColor,
  });

  final String label;
  final Color? backgroundColor;
  final Color? labeColor;

  @override
  Widget build(BuildContext context) {
    return Chip(
      elevation: 10,
      side: const BorderSide(
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
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
