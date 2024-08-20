import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? sizeText;
  final Color? colorText;
  const CustomText(
      {super.key, required this.text, this.colorText, this.sizeText});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: sizeText ?? 20,
          fontWeight: FontWeight.bold,
          color: colorText ?? Colors.black),
    );
  }
}
