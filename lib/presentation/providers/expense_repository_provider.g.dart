// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$expenseRepositoryHash() => r'5d13178262d05ac6d2118e3457f7ce63559864df';

/// See also [expenseRepository].
@ProviderFor(expenseRepository)
final expenseRepositoryProvider =
    AutoDisposeProvider<ExpenseRepository>.internal(
      expenseRepository,
      name: r'expenseRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$expenseRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ExpenseRepositoryRef = AutoDisposeProviderRef<ExpenseRepository>;
String _$expenseListNotifierHash() =>
    r'fde546bbcbad2fa3685c19ec5ccee2ed475a6a55';

/// See also [ExpenseListNotifier].
@ProviderFor(ExpenseListNotifier)
final expenseListNotifierProvider = AutoDisposeAsyncNotifierProvider<
  ExpenseListNotifier,
  List<Expense>
>.internal(
  ExpenseListNotifier.new,
  name: r'expenseListNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$expenseListNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ExpenseListNotifier = AutoDisposeAsyncNotifier<List<Expense>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
