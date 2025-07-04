import 'package:control_gastos/presentation/views/charts/helpers/capitalize.dart';
import 'package:control_gastos/common/utils/color_by_category.dart';
import 'package:flutter/material.dart';
import 'package:control_gastos/domain/entities/expense.dart';

class CategoryLegend extends StatelessWidget {
  final Map<ExpenseCategory, double> categoryTotals;

  const CategoryLegend({super.key, required this.categoryTotals});

  @override
  Widget build(BuildContext context) {
    final items = categoryTotals.entries.toList();
    final totalAmount = categoryTotals.values.fold<double>(
      0,
      (sum, value) => sum + value,
    );
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 25,
        mainAxisSpacing: 12,
        childAspectRatio: 6,
      ),
      itemBuilder: (context, index) {
        final entry = items[index];
        final color = getColorByCategory(entry.key);
        final value = entry.value;
        final percentage = value / totalAmount * 100;

        return Row(
          children: [
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                '${capitalize(entry.key.name)} (${'${percentage.toStringAsFixed(1)}%'})',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        );
      },
    );
  }
}
