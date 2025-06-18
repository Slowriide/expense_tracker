import 'package:control_gastos/presentation/views/charts/providers/charts_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChartViewContainer extends ConsumerWidget {
  const ChartViewContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isIncome = ref.watch(isIncomeSelectedProvider);
    final isYearly = ref.watch(isYearlySelectedProvider);

    return Center(
      child: Text(
        'Mostrando ${isIncome ? "Ingresos" : "Gastos"} - ${isYearly ? "Anual" : "Mensual"}',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
