import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? label;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool? obscureText;

  CustomTextFormField(
      {super.key,
      this.hintText,
      this.label,
      this.controller,
      this.validator,
      this.prefixIcon,
      this.suffixIcon,
      this.keyboardType,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText ?? 'Type...',
          label: Text(label ?? ''),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
    );
  }
}
