part of 'movies_details_cubit.dart';

class MoviesDetailsState extends Equatable {
  const MoviesDetailsState({
    required this.movie,
  });

  final Movies movie;

  static MoviesDetailsState loaded(Movies movie) {
    return MoviesDetailsState(
      movie: movie,
    );
  }

  @override
  List<Object?> get props => [
        movie,
      ];

  MoviesDetailsState copyWith({
    Movies? movie,
  }) {
    return MoviesDetailsState(
      movie: movie ?? this.movie,
    );
  }
}
