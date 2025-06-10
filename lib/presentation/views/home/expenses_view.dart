import 'package:control_gastos/domain/entities/expense.dart';
import 'package:control_gastos/presentation/presentation.dart';
import 'package:control_gastos/presentation/providers/expense_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ExpensesView extends ConsumerStatefulWidget {
  const ExpensesView({super.key});

  @override
  ExpensesViewState createState() => ExpensesViewState();
}

class ExpensesViewState extends ConsumerState<ExpensesView> {
  void _showExpenseMenu(
    BuildContext context,
    Offset position,
    Expense expense,
  ) async {
    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        position.dx,
        position.dy,
      ),
      items: [
        const PopupMenuItem(value: 'edit', child: Text('Editar')),
        const PopupMenuItem(value: 'delete', child: Text('Borrar')),
      ],
    );

    switch (selected) {
      case 'edit':
        if (expense.id != null) {
          // ignore: use_build_context_synchronously
          context.push('/editexpenses', extra: expense);
        }
        break;
      case 'delete':
        if (expense.id != null) {
          await ref
              .read(expenseListNotifierProvider.notifier)
              .deleteExpense(expense.id!);
        }

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final expensesAsync = ref.watch(expenseListNotifierProvider);

    return expensesAsync.when(
      data:
          (expenses) => ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              final expense = expenses[index];
              return GestureDetector(
                onTap: () {
                  if (expense.id != null) {
                    context.push('/editexpenses', extra: expense);
                  }
                },
                onLongPressStart: (details) {
                  _showExpenseMenu(context, details.globalPosition, expense);
                },
                child: ExpenseTile(expense: expense),
              );
            },
          ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }
}
