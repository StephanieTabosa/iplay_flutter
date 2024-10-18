import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../movies_navigator.dart';

part 'movies_home_state.dart';

class MoviesHomeCubit extends Cubit<MoviesHomeState> {
  MoviesHomeCubit({
    required MoviesNavigator moviesNavigator,
  })  : _moviesNavigator = moviesNavigator,
        super(
          const MoviesHomeState(),
        );

  final MoviesNavigator _moviesNavigator;

  void onContinueButtonTap() {
    _moviesNavigator.openMoviesList();
  }
}
