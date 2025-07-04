import 'package:control_gastos/domain/entities/expense.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

IconData getIconByCategory(ExpenseCategory category) {
  switch (category) {
    case ExpenseCategory.food:
      return Icons.fastfood_outlined;
    case ExpenseCategory.transport:
      return Icons.directions_bus_outlined;
    case ExpenseCategory.entertainment:
      return Icons.movie_creation_outlined;
    case ExpenseCategory.shopping:
      return Icons.shopping_bag_outlined;
    case ExpenseCategory.utilities:
      return Icons.electric_bolt_outlined;
    case ExpenseCategory.healt:
      return Icons.healing_outlined;
    case ExpenseCategory.gym:
      return FontAwesomeIcons.dumbbell;
    case ExpenseCategory.education:
      return Icons.school_outlined;
    case ExpenseCategory.work:
      return Icons.work_outline;
    case ExpenseCategory.other:
      return Icons.miscellaneous_services_sharp;
  }
}
