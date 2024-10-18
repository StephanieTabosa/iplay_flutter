import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/data/failures.dart';
import '../../../shared/utils/status.dart';
import '../../domain/entities/movies.dart';
import '../../domain/usecases/get_movies_list_usecase.dart';
import '../../movies_navigator.dart';

part 'movies_list_state.dart';

class MoviesListCubit extends Cubit<MoviesListState> {
  MoviesListCubit({
    required MoviesNavigator moviesNavigator,
    required GetMoviesListUsecase getMoviesListUsecase,
  })  : _moviesNavigator = moviesNavigator,
        _getMoviesListUsecase = getMoviesListUsecase,
        super(
          const MoviesListState(),
        );

  final MoviesNavigator _moviesNavigator;
  final GetMoviesListUsecase _getMoviesListUsecase;

  // Actions
  Future<void> onInit() async {
    await _getMoviesList();
  }

  Future<void> _getMoviesList() async {
    emit(state.copyWith(moviesListStatus: Status.loading));
    final result = await _getMoviesListUsecase.getMoviesList();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            moviesListStatus: Status.failure,
            failure: failure,
          ),
        );
      },
      (movies) {
        emit(
          state.copyWith(
            movies: movies,
            moviesListStatus: Status.success,
          ),
        );
      },
    );
  }

  void openDetailsPage(Movies movie) {
    _moviesNavigator.openMoviesDetails(movie: movie);
  }
}
