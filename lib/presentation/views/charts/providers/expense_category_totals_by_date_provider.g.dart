// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_category_totals_by_date_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$expenseCategoryTotalsByDateHash() =>
    r'55dc3c5ed28d70adf7fc65b9697f93f6747452de';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [expenseCategoryTotalsByDate].
@ProviderFor(expenseCategoryTotalsByDate)
const expenseCategoryTotalsByDateProvider = ExpenseCategoryTotalsByDateFamily();

/// See also [expenseCategoryTotalsByDate].
class ExpenseCategoryTotalsByDateFamily
    extends Family<AsyncValue<Map<ExpenseCategory, double>>> {
  /// See also [expenseCategoryTotalsByDate].
  const ExpenseCategoryTotalsByDateFamily();

  /// See also [expenseCategoryTotalsByDate].
  ExpenseCategoryTotalsByDateProvider call({
    required DateFilterType filtertype,
    required FilterDate filterValue,
    bool isIncome = false,
  }) {
    return ExpenseCategoryTotalsByDateProvider(
      filtertype: filtertype,
      filterValue: filterValue,
      isIncome: isIncome,
    );
  }

  @override
  ExpenseCategoryTotalsByDateProvider getProviderOverride(
    covariant ExpenseCategoryTotalsByDateProvider provider,
  ) {
    return call(
      filtertype: provider.filtertype,
      filterValue: provider.filterValue,
      isIncome: provider.isIncome,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'expenseCategoryTotalsByDateProvider';
}

/// See also [expenseCategoryTotalsByDate].
class ExpenseCategoryTotalsByDateProvider
    extends AutoDisposeFutureProvider<Map<ExpenseCategory, double>> {
  /// See also [expenseCategoryTotalsByDate].
  ExpenseCategoryTotalsByDateProvider({
    required DateFilterType filtertype,
    required FilterDate filterValue,
    bool isIncome = false,
  }) : this._internal(
         (ref) => expenseCategoryTotalsByDate(
           ref as ExpenseCategoryTotalsByDateRef,
           filtertype: filtertype,
           filterValue: filterValue,
           isIncome: isIncome,
         ),
         from: expenseCategoryTotalsByDateProvider,
         name: r'expenseCategoryTotalsByDateProvider',
         debugGetCreateSourceHash:
             const bool.fromEnvironment('dart.vm.product')
                 ? null
                 : _$expenseCategoryTotalsByDateHash,
         dependencies: ExpenseCategoryTotalsByDateFamily._dependencies,
         allTransitiveDependencies:
             ExpenseCategoryTotalsByDateFamily._allTransitiveDependencies,
         filtertype: filtertype,
         filterValue: filterValue,
         isIncome: isIncome,
       );

  ExpenseCategoryTotalsByDateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filtertype,
    required this.filterValue,
    required this.isIncome,
  }) : super.internal();

  final DateFilterType filtertype;
  final FilterDate filterValue;
  final bool isIncome;

  @override
  Override overrideWith(
    FutureOr<Map<ExpenseCategory, double>> Function(
      ExpenseCategoryTotalsByDateRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExpenseCategoryTotalsByDateProvider._internal(
        (ref) => create(ref as ExpenseCategoryTotalsByDateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filtertype: filtertype,
        filterValue: filterValue,
        isIncome: isIncome,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<ExpenseCategory, double>>
  createElement() {
    return _ExpenseCategoryTotalsByDateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExpenseCategoryTotalsByDateProvider &&
        other.filtertype == filtertype &&
        other.filterValue == filterValue &&
        other.isIncome == isIncome;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filtertype.hashCode);
    hash = _SystemHash.combine(hash, filterValue.hashCode);
    hash = _SystemHash.combine(hash, isIncome.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExpenseCategoryTotalsByDateRef
    on AutoDisposeFutureProviderRef<Map<ExpenseCategory, double>> {
  /// The parameter `filtertype` of this provider.
  DateFilterType get filtertype;

  /// The parameter `filterValue` of this provider.
  FilterDate get filterValue;

  /// The parameter `isIncome` of this provider.
  bool get isIncome;
}

class _ExpenseCategoryTotalsByDateProviderElement
    extends AutoDisposeFutureProviderElement<Map<ExpenseCategory, double>>
    with ExpenseCategoryTotalsByDateRef {
  _ExpenseCategoryTotalsByDateProviderElement(super.provider);

  @override
  DateFilterType get filtertype =>
      (origin as ExpenseCategoryTotalsByDateProvider).filtertype;
  @override
  FilterDate get filterValue =>
      (origin as ExpenseCategoryTotalsByDateProvider).filterValue;
  @override
  bool get isIncome => (origin as ExpenseCategoryTotalsByDateProvider).isIncome;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
