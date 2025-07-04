import 'package:control_gastos/common/utils/color_by_category.dart';
import 'package:control_gastos/presentation/views/charts/helpers/date_filter_type.dart';
import 'package:control_gastos/presentation/views/charts/providers/charts_filter_provider.dart';
import 'package:control_gastos/presentation/views/charts/providers/expense_category_totals_by_date_provider.dart';
import 'package:control_gastos/presentation/views/charts/providers/filter_value_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryPieChart extends ConsumerWidget {
  const CategoryPieChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isIncome = ref.watch(isIncomeSelectedProvider);
    final isYearly = ref.watch(isYearlySelectedProvider);

    final filterType = isYearly ? DateFilterType.year : DateFilterType.month;
    final filterValue = ref.watch(filterValueProviderProvider);

    final categoryTotals = ref.watch(
      expenseCategoryTotalsByDateProvider(
        filterValue: filterValue,
        filtertype: filterType,
        isIncome: isIncome,
      ),
    );

    return categoryTotals.when(
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => CircularProgressIndicator(strokeWidth: 2),
      data: (totals) {
        final totalAmount = totals.values.fold<double>(
          0,
          (sum, value) => sum + value,
        );

        if (totalAmount == 0) {
          return const Center(child: Text('No hay datos para mostrar'));
        }
        return Column(
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 90,
                  sections:
                      totals.entries.map((entry) {
                        final category = entry.key;
                        final value = entry.value;
                        final percentage = value / totalAmount * 100;

                        return PieChartSectionData(
                          value: value,
                          title: '${percentage.toStringAsFixed(1)}%',
                          color: getColorByCategory(category),
                          radius: 45,
                          titleStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        );
                      }).toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
