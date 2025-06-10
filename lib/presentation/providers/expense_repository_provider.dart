import 'package:control_gastos/data/local/sql_database.dart';
import 'package:control_gastos/data/repositories/expense_impl.dart';
import 'package:control_gastos/domain/entities/expense.dart';
import 'package:control_gastos/domain/repositories/expense_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expense_repository_provider.g.dart';

@riverpod
ExpenseRepository expenseRepository(Ref ref) {
  final db = DatabaseHelper.instance;
  return ExpenseImpl(db);
}

@riverpod
class ExpenseListNotifier extends _$ExpenseListNotifier {
  @override
  Future<List<Expense>> build() async {
    return _loadExpenses();
  }

  Future<List<Expense>> _loadExpenses() async {
    final repo = ref.read(expenseRepositoryProvider);
    return await repo.getExpenses();
  }

  Future<void> addExpense(Expense expense) async {
    final repo = ref.read(expenseRepositoryProvider);
    await repo.addExpense(expense);

    state = const AsyncValue.loading();
    state = AsyncValue.data(await _loadExpenses());
  }

  Future<void> updateExpense(Expense expense) async {
    final repo = ref.read(expenseRepositoryProvider);
    await repo.updateExpense(expense);

    state = const AsyncLoading();
    state = AsyncValue.data(await _loadExpenses());
  }

  Future<void> deleteExpense(int id) async {
    final repo = ref.read(expenseRepositoryProvider);
    await repo.deleteExpense(id);

    state = const AsyncLoading();
    state = AsyncValue.data(await _loadExpenses());
  }
}
