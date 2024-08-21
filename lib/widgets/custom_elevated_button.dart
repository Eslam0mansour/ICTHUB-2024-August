import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? backgroundColor;
  final double? borderRadius;
  final String textButton;
  void Function() onPressed;
  final double? fontSize;
  final bool isLoading;

  CustomElevatedButton({
    super.key,
    required this.textButton,
    required this.onPressed,
    this.backgroundColor,
    this.borderRadius,
    this.fontSize,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.amber,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10))),
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(
              textButton,
              style: TextStyle(fontSize: fontSize ?? 18),
            ),
    );
  }
}
