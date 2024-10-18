part of 'movies_list_cubit.dart';

class MoviesListState extends Equatable {
  const MoviesListState({
    this.movies = const [],
    this.moviesListStatus = Status.initial,
    this.failure,
  });

  final List<Movies> movies;
  final Status moviesListStatus;
  final Failure? failure;

  @override
  List<Object?> get props => [
        movies,
        moviesListStatus,
        failure,
      ];

  MoviesListState copyWith({
    List<Movies>? movies,
    Status? moviesListStatus,
    Failure? failure,
  }) {
    return MoviesListState(
      movies: movies ?? this.movies,
      moviesListStatus: moviesListStatus ?? this.moviesListStatus,
      failure: failure ?? this.failure,
    );
  }
}
