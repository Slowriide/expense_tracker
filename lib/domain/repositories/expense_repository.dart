import 'package:control_gastos/domain/entities/expense.dart';

abstract class ExpenseRepository {
  Future<List<Expense>> getExpenses();
  Future<void> addExpense(Expense expense);
  Future<void> updateExpense(Expense expense);
  Future<void> deleteExpense(int id);
}
