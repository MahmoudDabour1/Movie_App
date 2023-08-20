part of 'search_bloc.dart';

class SearchState extends Equatable {
  final List<Search> searchResults;
  final SearchRequestState searchState;
  final String searchMessage;

  const SearchState({
    this.searchResults = const [],
    this.searchState = SearchRequestState.empty,
    this.searchMessage = '',
  });

  SearchState copyWith({
    List<Search>? searchResults,
    SearchRequestState? searchState,
    String? searchMessage,
  }) {
    return SearchState(
      searchResults: searchResults ?? this.searchResults,
      searchState: searchState ?? this.searchState,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object> get props => [
        searchResults,
        searchState,
        searchMessage,
      ];
}
