import 'package:control_gastos/domain/entities/filter_date.dart';
import 'package:control_gastos/presentation/views/charts/providers/charts_filter_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_value_provider.g.dart';

@riverpod
class FilterValueProvider extends _$FilterValueProvider {
  @override
  FilterDate build() {
    final now = DateTime.now();

    return FilterDate(month: now.month, year: now.year);
  }

  void next() {
    final isYearly = ref.watch(isYearlySelectedProvider);
    if (isYearly) {
      state = state.copyWith(year: state.year + 1);
    } else {
      int newMonth = state.month + 1;
      int newYear = state.year;
      if (newMonth > 12) {
        newMonth = 1;
        newYear++;
      }
      state = state.copyWith(month: newMonth, year: newYear);
    }
  }

  void previous() {
    final isYearly = ref.watch(isYearlySelectedProvider);
    if (isYearly) {
      state = state.copyWith(year: state.year - 1);
    } else {
      int newMonth = state.month - 1;
      int newYear = state.year;
      if (newMonth < 1) {
        newMonth = 12;
        newYear--;
      }
      state = state.copyWith(month: newMonth, year: newYear);
    }
  }
}
