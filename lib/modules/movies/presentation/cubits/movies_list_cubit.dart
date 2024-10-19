import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/data/failures.dart';
import '../../../shared/utils/status.dart';
import '../../data/hive/favorites_movies_box_handler.dart';
import '../../domain/entities/movies.dart';
import '../../domain/usecases/get_movies_list_usecase.dart';
import '../../movies_navigator.dart';

part 'movies_list_state.dart';

class MoviesListCubit extends Cubit<MoviesListState> {
  MoviesListCubit({
    required MoviesNavigator moviesNavigator,
    required GetMoviesListUsecase getMoviesListUsecase,
    required FavoritesMoviesBoxHandler favoritesMoviesBoxHandler,
  })  : _moviesNavigator = moviesNavigator,
        _getMoviesListUsecase = getMoviesListUsecase,
        _favoritesMoviesBoxHandler = favoritesMoviesBoxHandler,
        super(
          const MoviesListState(),
        );

  final MoviesNavigator _moviesNavigator;
  final GetMoviesListUsecase _getMoviesListUsecase;
  final FavoritesMoviesBoxHandler _favoritesMoviesBoxHandler;

  // Actions
  Future<void> onInit() async {
    await _favoritesMoviesBoxHandler.openBox('favorite');
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

  void onFavoriteTap(int movieId) {
    if (_favoritesMoviesBoxHandler.isFavorite(movieId)) {
      _favoritesMoviesBoxHandler.removeFavorite(movieId);
    } else {
      _favoritesMoviesBoxHandler.addFavorite(movieId);
    }
    emit(state.copyWith(movies: state.movies));
  }

  bool isFavorite(int movieId) {
    return _favoritesMoviesBoxHandler.isFavorite(movieId);
  }
}
