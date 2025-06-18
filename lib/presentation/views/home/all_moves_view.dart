import 'package:control_gastos/presentation/providers/search/filtered_expenses_provider.dart';
import 'package:control_gastos/presentation/providers/search/search_text_provider.dart';
import 'package:control_gastos/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AllMovesView extends ConsumerStatefulWidget {
  const AllMovesView({super.key});

  @override
  AllMovesViewState createState() => AllMovesViewState();
}

class AllMovesViewState extends ConsumerState<AllMovesView> {
  @override
  Widget build(BuildContext context) {
    final filtedesExpenses = ref.watch(filteredExpensesProvider);

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        ref.read(searchTextProvider.notifier).clear();
      },
      child: Scaffold(
        appBar: ExpenseAppbar('Spending History'),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: ListView.builder(
            itemCount: filtedesExpenses.length,
            itemBuilder: (context, index) {
              final expense = filtedesExpenses[index];
              return GestureDetector(
                onTap: () {
                  if (expense.id != null) {
                    context.push('/editexpenses', extra: expense);
                  }
                },

                child: ExpenseTile(expense: expense),
              );
            },
          ),
        ),
      ),
    );
  }
}
