part of 'bottom_bar_bloc.dart';

@immutable
abstract class BottomBarEvent extends Equatable {
  const BottomBarEvent();
}

class GetBottomBarTapEvent extends BottomBarEvent {
  final int index;

  const GetBottomBarTapEvent({required this.index});

  @override
  List<Object> get props => [index];
}
