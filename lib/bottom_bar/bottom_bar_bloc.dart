
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../movies/presentation/screens/movie_screen.dart';
import '../search/presentation/screens/search_screen.dart';
import '../tvs/presentation/screens/tv_screen.dart';

part 'bottom_bar_event.dart';
part 'bottom_bar_state.dart';

class BottomBarBloc extends Bloc<BottomBarEvent, BottomBarState> {
  BottomBarBloc() : super( const BottomBarInitial(index: 0)) {
    on<BottomBarEvent> ((event,emit) {
      if(event is GetBottomBarTapEvent){
        emit(BottomBarInitial(index: event.index));
      }
    });
  }
  }


  // FutureOr<void> getBottomBarScreen(GetBottomBarTapEvent event, Emitter<BottomBarState> emit) {
  //   currentIndex = event.index;
  //   emit(BottomBarChangePageState());
  // }
