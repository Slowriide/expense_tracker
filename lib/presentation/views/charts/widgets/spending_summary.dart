import 'package:control_gastos/common/utils/color_by_category.dart';
import 'package:control_gastos/common/utils/get_icon_by_category.dart';
import 'package:control_gastos/domain/entities/expense.dart';
import 'package:control_gastos/presentation/views/charts/helpers/capitalize.dart';
import 'package:flutter/material.dart';

class SpendingSummary extends StatelessWidget {
  final Map<ExpenseCategory, double> categoryTotals;
  const SpendingSummary({super.key, required this.categoryTotals});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final items = categoryTotals.entries.toList();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 5,
            offset: Offset(3, 5),
            spreadRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Spending summary',
              style: textStyle.bodyLarge?.copyWith(fontSize: 18),
            ),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: [
                      Icon(
                        getIconByCategory(item.key),
                        color: getColorByCategory(item.key),
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Text(capitalize(item.key.name)),
                      Spacer(),
                      Text(
                        '\$${item.value.toStringAsFixed(2)}',
                        style: textStyle.bodyMedium,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
