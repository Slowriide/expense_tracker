import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_day_provider.g.dart';

@riverpod
class SelectedDay extends _$SelectedDay {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void setSelectedDate(DateTime day) {
    state = day;
  }
}
