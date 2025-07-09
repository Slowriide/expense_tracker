import 'package:control_gastos/common/utils/get_month_by_number.dart';
import 'package:control_gastos/presentation/views/charts/helpers/date_filter_type.dart';
import 'package:control_gastos/presentation/views/charts/providers/charts_filter_provider.dart';
import 'package:control_gastos/presentation/views/charts/providers/expense_category_totals_by_date_provider.dart';
import 'package:control_gastos/presentation/views/charts/providers/filter_value_provider.dart';
import 'package:control_gastos/presentation/views/charts/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChartViewContainer extends ConsumerWidget {
  const ChartViewContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isIncome = ref.watch(isIncomeSelectedProvider);
    final isYearly = ref.watch(isYearlySelectedProvider);

    // Definir el tipo de filtro (mes o año)
    final filterType = isYearly ? DateFilterType.year : DateFilterType.month;
    final filterValue = ref.watch(filterValueProviderProvider);

    final totalAsync = ref.watch(
      expenseCategoryTotalsByDateProvider(
        filterValue: filterValue,
        filtertype: filterType,
        isIncome: isIncome,
      ),
    );

    return Column(
      children: [
        Container(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ' ${isIncome ? "Incomes" : "Expenses"} - ${isYearly ? "Year ${filterValue.year}" : "${getMonthByNumber(filterValue.month)} ${filterValue.year}"} ',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(fontSize: 18),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          ref
                              .read(filterValueProviderProvider.notifier)
                              .previous();
                        },
                        icon: Icon(Icons.arrow_back_ios_rounded),
                      ),
                      IconButton(
                        onPressed: () {
                          ref.read(filterValueProviderProvider.notifier).next();
                        },
                        icon: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ],
                  ),
                ],
              ),
              totalAsync.when(
                data: (totals) {
                  if (totals.isEmpty) {
                    return SizedBox(
                      height: 250,
                      child: Center(
                        child: const Text("No hay datos para mostrar."),
                      ),
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CategoryPieChart(),
                      CategoryLegend(categoryTotals: totals),
                    ],
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        totalAsync.when(
          data: (totals) {
            if (totals.isEmpty) {
              return const SizedBox(height: 5);
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [SpendingSummary(categoryTotals: totals)],
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ],
    );
  }
}
