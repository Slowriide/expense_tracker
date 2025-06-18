import 'package:control_gastos/domain/entities/expense.dart';
import 'package:control_gastos/presentation/providers/expense_repository_provider.dart';
import 'package:control_gastos/presentation/providers/search/search_text_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_expenses_provider.g.dart';

@riverpod
List<Expense> filteredExpenses(Ref ref) {
  final search = ref.watch(searchTextProvider).toLowerCase();
  final expensesAsync = ref.watch(expenseListNotifierProvider);

  return expensesAsync.when(
    data: (expenses) {
      if (search.isEmpty) return expenses;
      return expenses
          .where((e) => e.title.toLowerCase().contains(search))
          .toList();
    },
    loading: () => [],
    error: (_, __) => [],
  );
}
