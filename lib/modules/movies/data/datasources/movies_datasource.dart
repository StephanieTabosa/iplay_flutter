import '../../domain/entities/movies.dart';

abstract class MoviesDatasource {
  Future<List<Movies>> getMoviesList();
}
