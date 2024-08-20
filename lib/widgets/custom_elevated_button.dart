import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? backgroundColor;
  final double? borderRadius;
  final String textButton;
  void Function() onPressed;
  final double? fontSize;

  CustomElevatedButton(
      {super.key,
      required this.textButton,
      required this.onPressed,
      this.backgroundColor,
      this.borderRadius,
      this.fontSize
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Colors.amber,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10))),
        child: Text(textButton,style: TextStyle(fontSize: fontSize??18),));
  }
}
