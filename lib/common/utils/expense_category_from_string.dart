import 'package:control_gastos/domain/entities/expense.dart';

ExpenseCategory expenseCategoryFromString(String? name) {
  if (name == null) return ExpenseCategory.other;
  try {
    return ExpenseCategory.values.byName(name);
  } catch (_) {
    return ExpenseCategory.other;
  }
}
