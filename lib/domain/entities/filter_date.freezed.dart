// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FilterDate {

 int get month; int get year;
/// Create a copy of FilterDate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterDateCopyWith<FilterDate> get copyWith => _$FilterDateCopyWithImpl<FilterDate>(this as FilterDate, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterDate&&(identical(other.month, month) || other.month == month)&&(identical(other.year, year) || other.year == year));
}


@override
int get hashCode => Object.hash(runtimeType,month,year);

@override
String toString() {
  return 'FilterDate(month: $month, year: $year)';
}


}

/// @nodoc
abstract mixin class $FilterDateCopyWith<$Res>  {
  factory $FilterDateCopyWith(FilterDate value, $Res Function(FilterDate) _then) = _$FilterDateCopyWithImpl;
@useResult
$Res call({
 int month, int year
});




}
/// @nodoc
class _$FilterDateCopyWithImpl<$Res>
    implements $FilterDateCopyWith<$Res> {
  _$FilterDateCopyWithImpl(this._self, this._then);

  final FilterDate _self;
  final $Res Function(FilterDate) _then;

/// Create a copy of FilterDate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? month = null,Object? year = null,}) {
  return _then(_self.copyWith(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _FilterDate implements FilterDate {
  const _FilterDate({required this.month, required this.year});
  

@override final  int month;
@override final  int year;

/// Create a copy of FilterDate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterDateCopyWith<_FilterDate> get copyWith => __$FilterDateCopyWithImpl<_FilterDate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterDate&&(identical(other.month, month) || other.month == month)&&(identical(other.year, year) || other.year == year));
}


@override
int get hashCode => Object.hash(runtimeType,month,year);

@override
String toString() {
  return 'FilterDate(month: $month, year: $year)';
}


}

/// @nodoc
abstract mixin class _$FilterDateCopyWith<$Res> implements $FilterDateCopyWith<$Res> {
  factory _$FilterDateCopyWith(_FilterDate value, $Res Function(_FilterDate) _then) = __$FilterDateCopyWithImpl;
@override @useResult
$Res call({
 int month, int year
});




}
/// @nodoc
class __$FilterDateCopyWithImpl<$Res>
    implements _$FilterDateCopyWith<$Res> {
  __$FilterDateCopyWithImpl(this._self, this._then);

  final _FilterDate _self;
  final $Res Function(_FilterDate) _then;

/// Create a copy of FilterDate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? month = null,Object? year = null,}) {
  return _then(_FilterDate(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
