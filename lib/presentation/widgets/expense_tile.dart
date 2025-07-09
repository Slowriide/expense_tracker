import 'package:control_gastos/common/utils/color_by_category.dart';
import 'package:control_gastos/common/utils/get_icon_by_category.dart';
import 'package:control_gastos/domain/entities/expense.dart';
import 'package:control_gastos/presentation/providers/expense_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ExpenseTile extends ConsumerWidget {
  final Expense expense;

  const ExpenseTile({super.key, required this.expense});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void showExpenseMenu(
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

    final textStyle = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        if (expense.id != null) {
          context.push('/editexpenses', extra: expense);
        }
      },
      onLongPressStart: (details) {
        showExpenseMenu(context, details.globalPosition, expense);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icon and text for the expense category
            Row(
              children: [
                //icon
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    getIconByCategory(expense.category),
                    color: getColorByCategory(expense.category),
                    size: 25,
                  ),
                ),
                SizedBox(width: 10),

                //Text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(expense.title, style: textStyle.bodyMedium),
                    Text(
                      DateFormat(
                        'dd/MM/yyyy - hh:mm a',
                      ).format(expense.date.toLocal()),
                      style: textStyle.bodySmall?.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            // Amount spent
            Text(
              '\$${expense.amount.toStringAsFixed(2)}',
              style: textStyle.bodyLarge?.copyWith(
                color: expense.isIncome ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
