import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_text_provider.g.dart';

@Riverpod(keepAlive: true)
class SearchText extends _$SearchText {
  @override
  String build() => '';

  void set(String value) => state = value;

  void clear() => state = '';
}

@riverpod
class IsSearching extends _$IsSearching {
  @override
  bool build() => false;
  bool toggle() => state = !state;
  bool stop() => state = false;
}
