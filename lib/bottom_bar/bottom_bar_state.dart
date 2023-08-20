part of 'bottom_bar_bloc.dart';

@immutable
class BottomBarState extends Equatable {

  final int index;

  const BottomBarState({required this.index});

  @override
  List<Object> get props => [index];
}

class BottomBarInitial extends BottomBarState {
  const BottomBarInitial({required super.index});

  @override
  List<Object> get props => [];
}
//
// class BottomBarChangePageState extends BottomBarState {
//   @override
//   List<Object> get props => [];
// }
