import '../../../shared/typedefs/future_result.dart';
import '../entities/movies.dart';

abstract class GetMoviesListUsecase {
  FutureResult<List<Movies>> getMoviesList();
}
