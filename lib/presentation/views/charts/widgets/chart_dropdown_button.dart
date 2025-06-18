import 'package:control_gastos/presentation/views/charts/providers/charts_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChartDropdownButton extends ConsumerWidget {
  const ChartDropdownButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final isIncome = ref.watch(isIncomeSelectedProvider);
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: isIncome,
        items: [
          DropdownMenuItem(
            value: false,
            child: Text(
              'Expenses',
              style: textStyle.bodyLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          DropdownMenuItem(
            value: true,
            child: Text(
              'Incomes',
              style: textStyle.bodyLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
        onChanged: (value) {
          if (value != null) {
            ref.read(isIncomeSelectedProvider.notifier).toggle(value);
          }
        },
      ),
    );
  }
}
