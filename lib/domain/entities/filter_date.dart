import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_date.freezed.dart';

@freezed
abstract class FilterDate with _$FilterDate {
  const factory FilterDate({required int month, required int year}) =
      _FilterDate;
}
