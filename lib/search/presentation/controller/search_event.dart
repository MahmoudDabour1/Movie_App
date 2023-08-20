part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class GetSearchResultEvent extends SearchEvent {
  final String title;

  const GetSearchResultEvent(this.title);

  @override
  List<Object> get props => [title];
}