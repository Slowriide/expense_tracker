import 'package:control_gastos/domain/entities/expense.dart';
import 'package:control_gastos/domain/entities/filter_date.dart';
import 'package:control_gastos/presentation/providers/expense_repository_provider.dart';
import 'package:control_gastos/presentation/views/charts/helpers/date_filter_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expense_category_totals_by_date_provider.g.dart';

@riverpod
Future<Map<ExpenseCategory, double>> expenseCategoryTotalsByDate(
  Ref ref, {
  required DateFilterType filtertype,
  required FilterDate filterValue,
  bool isIncome = false,
}) async {
  final expenses = await ref.watch(expenseListNotifierProvider.future);

  final filteredExpenses = expenses.where((e) {
    final date = e.date;
    final bool matchesDate =
        filtertype == DateFilterType.month
            ? (date.month == filterValue.month && date.year == filterValue.year)
            : (date.year == filterValue.year);
    return e.isIncome == isIncome && matchesDate;
  });

  final Map<ExpenseCategory, double> totals = {};

  for (final expenses in filteredExpenses) {
    totals.update(
      expenses.category,
      (value) => value + expenses.amount,
      ifAbsent: () => expenses.amount,
    );
  }
  return totals;
}
