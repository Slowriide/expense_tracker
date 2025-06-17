import 'package:control_gastos/presentation/providers/expense_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'balance_provider.g.dart';

@riverpod
Future<({double income, double expense, double total})> balance(Ref ref) async {
  final expensesAsync = await ref.watch(expenseListNotifierProvider.future);

  final income = expensesAsync
      .where((expense) => expense.isIncome)
      .fold(0.0, (sum, e) => sum + e.amount);

  final expense = expensesAsync
      .where((expense) => !expense.isIncome)
      .fold(0.0, (sum, e) => sum + e.amount);

  return (income: income, expense: expense, total: income - expense);
}
