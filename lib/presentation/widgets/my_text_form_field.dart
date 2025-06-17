import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusnode;
  final String hint;
  final String labelText;
  final Color? labelColor;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const MyTextFormField({
    super.key,
    required this.controller,
    required this.hint,
    required this.labelText,
    this.focusnode,
    this.labelColor,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return TextFormField(
      controller: controller,
      focusNode: focusnode,
      keyboardType: keyboardType,
      style: textStyle.bodyLarge?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelStyle: textStyle.bodyLarge?.copyWith(color: labelColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),

      validator: validator,
    );
  }
}
