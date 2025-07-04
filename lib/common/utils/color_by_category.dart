import 'package:control_gastos/domain/entities/expense.dart';
import 'package:flutter/material.dart';

Color getColorByCategory(ExpenseCategory category) {
  switch (category) {
    case ExpenseCategory.education:
      return Colors.orange;
    case ExpenseCategory.entertainment:
      return Colors.red;
    case ExpenseCategory.food:
      return Colors.blueAccent;
    case ExpenseCategory.gym:
      return Colors.black;
    case ExpenseCategory.healt:
      return Colors.green;
    case ExpenseCategory.shopping:
      return Colors.purple;
    case ExpenseCategory.transport:
      return Colors.deepPurpleAccent;
    case ExpenseCategory.utilities:
      return Colors.deepOrange;
    case ExpenseCategory.work:
      return Colors.lightGreen;
    case ExpenseCategory.other:
      return Colors.grey;
  }
}
