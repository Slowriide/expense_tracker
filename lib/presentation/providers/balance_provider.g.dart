// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$balanceHash() => r'd1a6844f2b8a888c6cc67492426f762a55d9d23f';

/// See also [balance].
@ProviderFor(balance)
final balanceProvider = AutoDisposeFutureProvider<
  ({double income, double expense, double total})
>.internal(
  balance,
  name: r'balanceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$balanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BalanceRef =
    AutoDisposeFutureProviderRef<
      ({double income, double expense, double total})
    >;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
