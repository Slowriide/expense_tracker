import 'package:control_gastos/data/local/sql_database.dart';
import 'package:control_gastos/domain/entities/expense.dart';
import 'package:control_gastos/domain/repositories/expense_repository.dart';

class ExpenseImpl implements ExpenseRepository {
  final DatabaseHelper db;

  ExpenseImpl(this.db);

  @override
  Future<void> addExpense(Expense expense) async {
    await db.insertExpense(expense);
  }

  @override
  Future<List<Expense>> getExpenses() async {
    final result = await db.getExpenses();
    return result.map((e) => Expense.fromMap(e)).toList();
  }

  @override
  Future<void> updateExpense(Expense expense) async {
    await db.updateExpense(expense);
  }

  @override
  Future<void> deleteExpense(int id) async {
    await db.deleteExpense(id);
  }
}
