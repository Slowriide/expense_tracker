import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'charts_filter_provider.g.dart';

@riverpod
class IsIncomeSelected extends _$IsIncomeSelected {
  @override
  bool build() {
    return false;
  }

  void toggle(bool value) => state = value;
}

@riverpod
class IsYearlySelected extends _$IsYearlySelected {
  @override
  bool build() {
    return false;
  }

  void toggle(bool value) => state = value;
}
