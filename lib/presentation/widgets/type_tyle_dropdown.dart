import 'package:flutter/material.dart';

class TypeTyleDropdown extends StatelessWidget {
  final bool? isIncome;
  final void Function(bool?) onChanged;
  const TypeTyleDropdown({super.key, this.isIncome, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return DropdownButtonFormField(
      value: isIncome,
      decoration: InputDecoration(
        labelText: 'Type',
        floatingLabelStyle: textStyle.bodyLarge,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      items: [
        DropdownMenuItem(
          value: false,
          child: Text(
            'Expense',
            style: textStyle.bodyLarge?.copyWith(
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        DropdownMenuItem(
          value: true,
          child: Text(
            'Income',
            style: textStyle.bodyLarge?.copyWith(
              color: Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
      onChanged: onChanged,

      // (value) {
      //   if (value != null) {
      //     setState(() {
      //       _isIncome = value;
      //     });
      //   }
      // },
    );
  }
}
