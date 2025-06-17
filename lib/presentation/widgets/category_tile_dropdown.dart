import 'package:control_gastos/domain/entities/expense.dart';
import 'package:flutter/material.dart';

class CategoryTileDropdown extends StatelessWidget {
  final ExpenseCategory selectedCategory;
  final ValueChanged<ExpenseCategory> onChanged;

  const CategoryTileDropdown({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return SizedBox(
      height: 55,
      child: DropdownButtonFormField<ExpenseCategory>(
        value: selectedCategory,
        decoration: InputDecoration(
          labelText: 'Category',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        items:
            ExpenseCategory.values.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Text(
                  category.name[0].toUpperCase() + category.name.substring(1),
                  style: textStyle.bodyLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
        onChanged: (value) {
          if (value != null) {
            onChanged(value);
          }
        },
      ),
    );
  }
}
