// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_text_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchTextHash() => r'dbcf3c2df8ac528d5bc368f40a9d940ceed6cac5';

/// See also [SearchText].
@ProviderFor(SearchText)
final searchTextProvider = NotifierProvider<SearchText, String>.internal(
  SearchText.new,
  name: r'searchTextProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$searchTextHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchText = Notifier<String>;
String _$isSearchingHash() => r'90d3491193a9d0756c5315aabe964452a956cb4b';

/// See also [IsSearching].
@ProviderFor(IsSearching)
final isSearchingProvider =
    AutoDisposeNotifierProvider<IsSearching, bool>.internal(
      IsSearching.new,
      name: r'isSearchingProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$isSearchingHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$IsSearching = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
