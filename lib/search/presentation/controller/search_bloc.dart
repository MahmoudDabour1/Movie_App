import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_with_clean/core/utils/enums.dart';
import 'package:movies_with_clean/search/domain/use_cases/search_usecase.dart';

import '../../domain/entities/search.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.getSearchUseCase) : super(const SearchState()) {
    on<GetSearchResultEvent>(_getSearchResult);
  }

  final GetSearchUseCase getSearchUseCase;

  FutureOr<void> _getSearchResult(
      GetSearchResultEvent event, Emitter<SearchState> emit) async {
    if (event.title.trim().isEmpty) {
      return emit(
        state.copyWith(
          searchState: SearchRequestState.empty,
        ),
      );
    }
    emit(
      state.copyWith(
        searchState: SearchRequestState.loading,
      ),
    );
    final result = await getSearchUseCase(SearchParameters(title: event.title));
    result.fold(
      (l) => emit(state.copyWith(
        searchState: SearchRequestState.error,
        searchMessage: l.message,
      )),
      (r) {
        if (r.isEmpty) {
          emit(
            state.copyWith(
              searchState: SearchRequestState.noResult,
            ),
          );
        } else {
          emit(
            state.copyWith(
              searchState: SearchRequestState.loaded,
              searchResults: r,
            ),
          );
        }
      },
    );
  }
}
