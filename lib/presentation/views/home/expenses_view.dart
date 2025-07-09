import 'package:control_gastos/presentation/presentation.dart';
import 'package:control_gastos/presentation/providers/expense_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpensesView extends ConsumerStatefulWidget {
  const ExpensesView({super.key});

  @override
  ExpensesViewState createState() => ExpensesViewState();
}

class ExpensesViewState extends ConsumerState<ExpensesView> {
  @override
  Widget build(BuildContext context) {
    final expensesAsync = ref.watch(expenseListNotifierProvider);

    return expensesAsync.when(
      data:
          (expenses) => ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              final expense = expenses[index];
              return ExpenseTile(expense: expense);
            },
          ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }
}
