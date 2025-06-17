import 'package:control_gastos/presentation/providers/balance_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BalanceBox extends ConsumerWidget {
  const BalanceBox({super.key, required this.textStyle});

  final TextTheme textStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balanceAsync = ref.watch(balanceProvider);
    return balanceAsync.when(
      data:
          (balance) => Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade100,
                  blurRadius: 5,
                  offset: Offset(3, 5),
                  spreadRadius: 3,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total balance', style: textStyle.bodySmall),
                Text(
                  '\$ ${balance.total.toStringAsFixed(2)}',
                  style: textStyle.titleMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _incomeAndExpense(isIncome: true, amount: balance.income),
                    _incomeAndExpense(isIncome: false, amount: balance.expense),
                  ],
                ),
              ],
            ),
          ),
      error: (error, stackTrace) => Text('Error: $error'),
      loading:
          () => const Center(child: CircularProgressIndicator(strokeWidth: 2)),
    );
  }

  Row _incomeAndExpense({required bool isIncome, required double amount}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor:
              isIncome ? const Color(0xffdbfbe4) : const Color(0xffffe2e2),

          child:
              isIncome
                  ? FaIcon(
                    FontAwesomeIcons.arrowUp,
                    color: Colors.green,
                    size: 20,
                  )
                  : FaIcon(
                    FontAwesomeIcons.arrowDown,
                    color: Colors.red,
                    size: 20,
                  ),
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(isIncome ? 'Incomes' : 'Expenses', style: textStyle.bodySmall),

            Text('\$$amount', style: textStyle.bodySmall),
          ],
        ),
      ],
    );
  }
}
