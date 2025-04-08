import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchSuggestionProvider =
    StateNotifierProvider<SearchSuggestionNotifier, List<String>>((ref) {
  return SearchSuggestionNotifier();
});

class SearchSuggestionNotifier extends StateNotifier<List<String>> {
  SearchSuggestionNotifier() : super([]);

  void setSearchSuggestions(List<String> suggestions) {
    state = suggestions;
  }

  void clearSearchSuggestions() {
    state = [];
  }
}
