import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_with_clean/core/resources/color_manager.dart';
import 'package:movies_with_clean/core/resources/values_manager.dart';
import 'package:movies_with_clean/core/utils/enums.dart';

import '../../../core/services/services_locator.dart';
import '../controller/search_bloc.dart';
import '../widgets/no_result_widget.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/search_grid_view.dart';
import '../widgets/search_text.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SearchBloc>()..add(GetSearchResultEvent(title)),
      child: const SearchWidget(),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: AppPadding.p12,
            left: AppPadding.p16,
            right: AppPadding.p16,
          ),
          child: Column(
            children: [
              const SearchBarWidget(),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  switch (state.searchState) {
                    case SearchRequestState.empty:
                      return const SearchText();
                    case SearchRequestState.loading:
                      return Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.primary,
                        ),
                      );
                    case SearchRequestState.loaded:
                      return SearchGridView(
                        results: state.searchResults,
                      );
                    case SearchRequestState.error:
                      return Center(
                        child: Text(
                          state.searchMessage,
                        ),
                      );
                    case SearchRequestState.noResult:
                      return const NoResults();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
